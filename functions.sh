#!/opt/homebrew/bin/bash

to_integer() {
  input_string=$1
  # Extract the part before the slash
  integer_part="${input_string%%/*}"
  # Use 'bc' to perform division and get the integer result
  integer_result=$(echo "$integer_part / 1" | bc)
  # Print the integer result
  # echo "Integer Result: $integer_result"
  return $integer_result
}

calculate_percent() {
  echo ====================================================================================
  rate=$1
  passenger=$2

  # Extract the sign from the passenger variable (+ or -)
  sign="${passenger:0:1}"
  # Extract the percentage value without the sign
  percentage="${passenger:1:${#passenger}-2}"
  # Use BC to perform the addition
  result=$(echo "$rate $sign $percentage" | bc)
  # Echo the result
  echo "Result: $1$sign$percentage=$result%"
  echo ====================================================================================
}
