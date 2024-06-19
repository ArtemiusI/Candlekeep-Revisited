#!/usr/bin/env python3
# coding: utf-8

import sys, os
import frontmatter
import argparse
import re
from collections import OrderedDict

#parse args
parser = argparse.ArgumentParser(description='Get updates from IESDP', formatter_class=argparse.ArgumentDefaultsHelpFormatter)
parser.add_argument('-s', dest='iesdp_dir', help='iesdp directory', required=True)
parser.add_argument('--opcode_file', dest='opcode_file', help='opcode definition file (weidu tpp)', required=True)
args=parser.parse_args()

import ruamel.yaml
yaml = ruamel.yaml.YAML(typ="rt")
yaml.width = 4096
yaml.indent(mapping=2, sequence=4, offset=2)
# https://stackoverflow.com/questions/57382525/can-i-control-the-formatting-of-multiline-strings
from ruamel.yaml.scalarstring import LiteralScalarString
import textwrap
def LS(s):
  return LiteralScalarString(textwrap.dedent(s))

from bs4 import BeautifulSoup
from markdown import markdown


#init vars
opcode_file = args.opcode_file
iesdp_dir = args.iesdp_dir
opcode_dir = os.path.join(iesdp_dir, '_opcodes')
opcodes = []
opcodes_ee = []
ee_min_opcode = 318 # everything below this doesn't make it to opcode_ee.tpp
tpp_text = ""
skip_opcode_names = ['empty', 'crash', 'unknown']
file_formats_dir = os.path.join(iesdp_dir, "_data", 'file_formats')

def find_file(path, name):
  for root, dirs, files in os.walk(path):
    if name in files:
      return os.path.join(root, name)

def find_files(path, ext):
  flist = []
  for root, dirs, files in os.walk(path):
    for f in files:
      if f.lower().endswith(ext.lower()):
        flist.append(os.path.join(root, f))
  return flist

def opcode_name(name):
  # these are replace anywhere in the string
  replacements = {
    ' ': '_',
    ')': '_',
    '(': '_',
    ':': '',
    '-': '_',
    ',': '',
    '&': '',
    '.': '',
    "'": '',
    '/': '_',
    'modifier': 'mod',
    'resistance': 'resist',
    'removal_remove': 'remove',
    'high_level_ability': 'HLA',
    '____': '_',
    '___': '_',
    '__': '_',
    '__': '_' # intentional
  }
  # these are stripped from left part
  lstrip = [
    'item_',
    'graphics_',
    'spell_effect_', # should be before _spell
    'spell_',
    'stat_',
    'state_',
    'summon_',
  ]
  name = name.lower()
  for r in replacements:
    name = name.replace(r, replacements[r])
  name = name.rstrip('_').lstrip('_')
  for l in lstrip:
    if name.startswith(l):
      name = name[len(l):]
  return name

files = find_files(opcode_dir, 'html')
for f in files:
  opcode = frontmatter.load(f)
  if opcode['bg2'] == 1: # just bg2 opcodes for now
    opcodes.append(opcode)

opcodes = sorted(opcodes, key=lambda k: k["n"])
opcodes_unique = OrderedDict()
for o in opcodes:
  name = opcode_name(o['name'])
  if name in skip_opcode_names:
    continue
  name_count = len([i for i in opcodes_unique if i == name]) # some name collude, need to make unique
  if name_count > 0:
    name = name + '_{}'.format(name_count + 1)
  if o['n'] == 175: # hold and hold graphic share the same name
    name = "hold_graphic"
  opcodes_unique[name] = o['n']

for o in opcodes_unique:
  tpp_text += ("OPCODE_{} = {}\n".format(o, opcodes_unique[o]))

with open(opcode_file, 'w') as f:
  print(tpp_text, file=f)

### END OPCODES

### STRUCTURES
def get_prefix(file_version, data_file_name): # eff_v2 / body.yml
  base = re.sub('_v.*', '', file_version)
  version = re.sub('.*_v', '', file_version)
  version = version.replace('.', '')
  if version == '1':
    version = ''

  # custom prefix for some data structures
  fbase = data_file_name.replace('.yml', '')
  fbase_map = {
    'header': '',
    'body': '',
    'extended_header': 'head'
  }
  try:
    suffix = fbase_map[fbase]
  except:
    suffix = fbase

  prefix = "{}{}_".format(base, version)
  if suffix != '':
    prefix = prefix + "{}_".format(suffix)
  prefix = prefix.upper()
  return prefix

def get_id(item, prefix):
  # custom IElib id
  if 'id' in item:
    return prefix + item['id']

  # no custom id, constructing from description
  desc = item['desc']
  # iid = desc.split('\n', 1)[0].lower()
  iid = desc.lower()

  # strip links
  html = markdown(iid)
  iid = ''.join(BeautifulSoup(html, features="lxml").findAll(text=True))

  # custom replacements
  iid = iid.replace('probability ', 'probability')
  iid = iid.replace('usability ', 'usability')
  iid = iid.replace('parameter ', 'parameter')
  iid = iid.replace('resource ', 'resource')
  iid = iid.replace('alternative', 'alt')
  iid = iid.replace('.', '')

  iid = iid.replace(' ', '_')
  iid = prefix + iid

  # id must be alnum + '_' only
  if re.match(r'^[a-zA-Z0-9_]+$', iid):
    return iid
  else:
    print('Bad id: "{}". Aborting.'.format(iid))
    sys.exit(1)

def get_size(item):
  if 'length' in item:
    return item['length']
  size_map = {
    'byte': 1,
    'char': 1,
    'word': 2,
    'dword': 4,
    'resref': 8,
    'strref': 4
  }
  size = size_map[item['type']]
  if 'mult' in item:
    size = size * item['mult']
  return size

def load_datafile(fpath, prefix):
  print("loading {}".format(fpath))
  with open(fpath) as yf:
    data = yaml.load(yf)
  cur_off = 0
  if 'offset' in data[0]:
    cur_off = data[0]['offset']

  
  items = OrderedDict()
  for i in data:
    if 'offset' in i and i['offset'] != cur_off:
      print("Error: offset mismatch. Expected {}, got {} for {}".format(cur_off, i['offset'], i))

    size = get_size(i)

    if 'unused' in i or 'unknown' in i:
      cur_off += size
      continue

    iid = get_id(i, prefix)
    items[iid] = hex(cur_off)
    cur_off += size
  return items

def dump_items(prefix, items):
  output_dir = os.path.join(structures_dir, prefix.lower().replace('_', ''))
  output_file = os.path.join(output_dir, 'iesdp.tpp')
  os.makedirs(output_dir, exist_ok=True)
  text = ''
  for i in items:
    text += '{} = {}\n'.format(i, items[i])
  with open(output_file, 'w') as fh:
    print(text, file=fh)

structures_dir = 'structures'
formats = os.listdir(file_formats_dir)
for ff in formats:
  ff_dir = os.path.join(file_formats_dir, ff)
  items = OrderedDict()
  for f in os.listdir(ff_dir):
    if f == 'feature_block.yml': # feature blocks handled separately
      continue
    prefix = get_prefix(ff, f)
    fpath = os.path.join(ff_dir, f)
    new_items = load_datafile(fpath, prefix)
    items = {**items, **new_items}
  dump_items(prefix, items)

# feature block
fpath = os.path.join(file_formats_dir, 'itm_v1', 'feature_block.yml')
prefix = 'FX_'
items = load_datafile(fpath, prefix)
dump_items(prefix, items)
