#!/bin/bash
cat Property_Tax_Roll.csv | grep "MADISON SCHOOLS" | cut -d ',' -f 7 | {
  sum=0;
  count=0;
  while read -r value; do
    sum=$((sum + value))
    count=$((count + 1))
  done
  echo "Sum: $sum"
  average=$(bc <<< "scale=2; $sum / $count")
  echo "Average: $average"
}
