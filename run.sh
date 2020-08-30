#!/usr/bin/env bash

set -e

INPUT_FILE=servers.txt
LOG_DIR=log

mkdir -p "$LOG_DIR"

i=0
while IFS="" read -r server || [ -n "$server" ]
do
  touch -a "$LOG_DIR/$server".csv
  python3 gobbler.py "$server" >> "$LOG_DIR/$server".csv &
  pids[${i}]=$!
  i=$((i + 1))
done < "$INPUT_FILE"

echo "started $i workers"

for pid in ${pids[*]}; do
    wait $pid
done

echo "done"
