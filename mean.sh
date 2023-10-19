#!/bin/bash
usage() {
  echo "usage: $0 <column> [file.csv]" >&2
  exit 1
}

if [ "$#" -lt 1 ] || [ "$#" -gt 2 ]; then
  usage
fi

column="$1"
file="${2:-/dev/stdin}"

if [ ! -e "$file" ]; then
  echo "File not found: $file" >&2
  exit 1
fi

mean=$(cut -d',' -f"$column" "$file" | tail -n +2 | awk '{ sum += $1; count++ } END { if (count > 0) print sum / count; else print "No data" }')

if [[ "$mean" =~ ^-?[0-9]*\.?[0-9]+$ ]]; then
  echo "Mean of column $column: $mean"
else
  echo "Error: Could not calculate the mean." >&2
  exit 1
fi
