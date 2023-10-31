#!/opt/homebrew/bin/bash
passengers() {
  # Declare an index array
  declare -a table

  # Initialize the index array with data
  table[0]="number:1 percent:+0.11%"
  table[1]="number:2 percent:-0.17%"
  table[2]="number:3 percent:-0.29%"
  table[3]="number:4 percent:-0.53%"

  # Ask the user to choose a car type until a valid choice is made
  user_choice=-1 # Initialize user_choice with an invalid value
  # Init percent
  percent=0

  echo ====================================================================================
  while [[ ! ($user_choice -ge 0 && $user_choice -le 3) ]]; do
    # Ask the user to choose a car type
    echo "Please choose a value by entering the corresponding index (0, 1, 2 or 3):"
    # Loop through the elements and split the data into key-value pairs
    for ((i = 0; i < ${#table[@]}; i++)); do
      data="${table[$i]}"
      IFS=' ' read -ra attributes <<<"$data"
      declare -A terminal_display
      for attr in "${attributes[@]}"; do
        IFS=':' read -ra kv <<<"$attr"
        key="${kv[0]}"
        value="${kv[1]}"
        terminal_display["$key"]="$value"
      done
      echo "[${i}] - Nb passengers: ${terminal_display["number"]}, Percent: ${terminal_display["percent"]}"
    done

    # Catch user decision
    read user_choice
    # user_choice=0

    # Testing
    if [[ ! $user_choice =~ ^[0-3]$ ]]; then
      echo "Invalid choice."
    fi

    if [[ $user_choice =~ ^[0-3]$ ]]; then
      # Loop through and print car information
      for index in "${!table[@]}"; do
        data="${table[$index]}"
        IFS=' ' read -ra attributes <<<"$data"
        declare -A data
        for attr in "${attributes[@]}"; do
          IFS=':' read -ra kv <<<"$attr"
          key="${kv[0]}"
          value="${kv[1]}"
          data["$key"]="$value"
        done

        if [ $index == $user_choice ]; then
          echo "You choose: [${index}] - Number of passengers: ${data["number"]}, Percent: ${data["percent"]}"
          percent=${data["percent"]}
        fi
      done
    fi
  done

  echo Percent: ${percent}
}
