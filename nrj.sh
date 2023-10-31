#!/opt/homebrew/bin/bash

nrj() {
  # Declare an index array
  declare -a table

  # Initialize the index array with data
  table[0]="name:Essence eco_note:5/10"
  table[1]="name:Electrique eco_note:9/10"
  table[2]="name:Gaz eco_note:6/10"
  table[3]="name:Diesel eco_note:4/10"
  table[4]="name:Hybride eco_note:7/10"

  # Ask the user to choose a car type until a valid choice is made
  user_choice=-1 # Initialize user_choice with an invalid value
  # Init note
  note=0

  echo ====================================================================================
  while [[ ! ($user_choice -ge 0 && $user_choice -le 4) ]]; do
    # Ask the user to choose a car type
    echo "Please choose a value by entering the corresponding index (0, 1, 2, 3 or 4):"
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
      echo "[${i}] - Name: ${terminal_display["name"]}, Eco Note: ${terminal_display["eco_note"]}"
    done

    # Catch user decision
    read user_choice
    # user_choice=1

    # Testing
    if [[ ! $user_choice =~ ^[0-4]$ ]]; then
      echo "Invalid choice."
    fi

    if [[ $user_choice =~ ^[0-4]$ ]]; then
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
          echo "You choose: [${index}] - Name: ${data["name"]}, Eco Note: ${data["eco_note"]}"
          note=${data["eco_note"]}
        fi
      done
    fi
  done

  echo Note: ${note}
}
