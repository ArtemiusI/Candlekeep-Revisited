#!/usr/bin/env python3
# coding: utf-8

import sys, os
import ruamel.yaml

yaml = ruamel.yaml.YAML(typ="rt")
yaml.width = 4096
yaml.indent(mapping=2, sequence=4, offset=2)

data_dir = sys.argv[1]
md_dir = sys.argv[2]


# template for functions pages
functions_header = """---
layout: page
title: "{title}"
permalink: "/{link}/"
---
# {title}
{{: .no_toc}}
{desc}

* TOC
{{:toc}}
"""

# template for types page
types_link = "types"
types_header = """---
layout: page
title: Variable types
nav_order: 2
permalink: /{}/
---
# Types
{{: .no_toc}}
Description of parameter types used in functions and macros.
* TOC
{{:toc}}
""".format(
    types_link
)


def find_file(path, name):
    for root, dirs, files in os.walk(path, followlinks=True):
        if name in files:
            return os.path.join(root, name)


def find_files(path, ext, skip_dirs=[]):
    flist = []
    for root, dirs, files in os.walk(path, followlinks=True):
        dirs[:] = [d for d in dirs if d not in skip_dirs]
        for f in files:
            if f.lower().endswith(ext.lower()):
                flist.append(os.path.join(root, f))
    return flist


def func_to_md(func):
    text = "\n---\n\n### **{}**\n".format(func["name"])
    text += get_label(func)
    text += "{}\n\n".format(func["desc"])
    if "int_params" in func:
        text += params_to_md(func, "int_params")
    if "string_params" in func:
        text += params_to_md(func, "string_params")
    if "return" in func:
        text += rets_to_md(func)
    return text


def get_label(func):
    if func["type"] == "patch":
        return "{: .d-inline-block }\npatch\n{: .label .label-green }\n\n"
    if func["type"] == "action":
        return "{: .d-inline-block }\naction\n{: .label .label-blue }\n\n"
    print("error: function {} has no type".format(func["name"]))
    sys.exit(1)


def params_to_md(func, ptype):
    type_map = {"string_params": "STR_VAR", "int_params": "INT_VAR"}
    text = (
        "| **{}** | **Description** | **Type** | **Default** |\n|:-|:-|:-|:-|".format(
            type_map[ptype]
        )
    )
    params = sorted(func[ptype], key=lambda k: k["name"])
    for sp in params:
        default = get_default(sp, func)
        name = sp["name"]
        if "required" in sp and sp["required"] == 1:
            default = "_required_{: class='required'}"
        ptype = get_ptype(sp["type"])
        text = text + "\n| {} | {} | {} | {} |".format(name, sp["desc"], ptype, default)
    text = text + "\n"
    return text


def rets_to_md(func):
    text = "\n| Return values | Description | Type |\n|:--------|:-----|:--------|"
    rets = sorted(func["return"], key=lambda k: k["name"])
    for r in rets:
        rtype = get_ptype(r["type"])
        text = text + "\n| {} | {} | {} |".format(r["name"], r["desc"], rtype)
    text = text + "\n"
    return text


def get_ptype(tname):
    try:
        ptype = [x for x in types if x["name"] == tname][0]
        ptext = "[{}](/{}/#{})".format(tname, types_link, tname)
        return ptext
    except:
        return tname


def get_default(param, func):
    if "default" in param:
        default = param["default"]
        return default
    ptype = param["type"]
    if "defaults" in func and ptype in func["defaults"]:
        default = func["defaults"][ptype]
        return default
    return ""


types_file = os.path.join(data_dir, "types.yml")
md_path = os.path.join(md_dir, types_link + ".md")
with open(types_file) as yf:
    types = yaml.load(yf)
text = types_header
for t in types:
    text = text + "\n## **{}**".format(t["name"])
    text = text + "\n{}".format(t["desc"])
with open(md_path, "w") as f:
    f.write(text)

sections_file = os.path.join(data_dir, "sections.yml")
with open(sections_file) as yf:
    sections = yaml.load(yf)
functions_dir = os.path.join(data_dir, "functions")
function_files = find_files(functions_dir, "yml")

for f in function_files:
    with open(f) as yf:
        data = yaml.load(yf)
    data = sorted(data, key=lambda k: k["name"])
    section_name = os.path.basename(f)
    section_name = os.path.splitext(section_name)[0]
    section = [s for s in sections if s["name"] == section_name][0]
    text = functions_header.format(
        title=section["title"], desc=section["desc"], link=section_name
    )
    for i in data:
        text = text + func_to_md(i)
    md_name = section_name + ".md"
    md_path = os.path.join(md_dir, md_name)
    with open(md_path, "w") as f:
        f.write(text)
