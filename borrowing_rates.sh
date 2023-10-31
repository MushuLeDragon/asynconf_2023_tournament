#!/opt/homebrew/bin/bash

borrowing_rates() {
  # table[0]="score:0-10 borrowing_rates:3%"
  # table[1]="score:11-15 borrowing_rates:2,74%"
  # table[2]="score:16-25 borrowing_rates:2,52%"
  # table[3]="score:26-33 borrowing_rates:2,1%"
  # table[4]="score:24-40 borrowing_rates:1,85%"

  rate=0

  # First parameter $1
  if ((0 <= $1 && $1 <= 10)); then
    rate=3
  elif ((11 <= $1 && $1 <= 15)); then
    rate=2.74
  elif ((16 <= $1 && $1 <= 24)); then
    rate=2.52
  elif ((26 <= $1 && $1 <= 33)); then
    rate=2.10
  elif ((34 <= $1 && $1 <= 40)); then
    rate=1.85
  fi

  echo Your borrowing rate is $rate%.
  # return $rate
}
