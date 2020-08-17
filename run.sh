#!/usr/bin/env bash

set -e

INPUT_FILE=/vol/servers.txt
OUTPUT_FILE=/vol/report.csv

true > "$OUTPUT_FILE"
i=0
while IFS="" read -r p || [ -n "$p" ]
do
  python3 gobbler.py "$p" >> "$OUTPUT_FILE" &
  pids[${i}]=$!
  i=$((i + 1))
done < "$INPUT_FILE"

echo "started $i workers"

for pid in ${pids[*]}; do
    wait $pid
done

echo "done"
