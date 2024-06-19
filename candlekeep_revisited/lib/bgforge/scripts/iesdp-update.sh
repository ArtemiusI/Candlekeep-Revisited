#!/bin/bash

set -xeu -o pipefail

# launch from root repo dir
ext_dir="external"
iesdp_dir="$ext_dir/iesdp"
repo="BGforgeNet/iesdp"
opcode_file="opcode.tpp"

if [[ ! -d "$iesdp_dir" ]]; then
  mkdir -p "$ext_dir"
  cd "$ext_dir"
  git clone https://github.com/$repo/
  cd iesdp
  git checkout ielib
  cd ../..
  # cd ..
fi
./scripts/iesdp-update.py -s "$iesdp_dir" --opcode_file "$opcode_file"
