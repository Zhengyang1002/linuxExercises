#!/bin/bash
sum=0
for number in {1000..2000}; do
  if [[ "$number" =~ ^[01]+$ ]]; then
    sum=$((sum + number))
  fi
done
echo "Sum of numbers with digits only from {0, 1}: $sum"
