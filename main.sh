#!/opt/homebrew/bin/bash
echo "${BASH_VERSION}"

# Include files
source ./functions.sh

source ./car_type.sh
source ./nrj.sh
source ./km.sh
source ./year.sh

source ./borrowing_rates.sh
source ./passengers.sh

# Init vars
score=0

##################################################################
########### Call functions car_type + extract to integer result ###########
car_type
# echo $note # get car_type note
to_integer ${note} # extract car_type note to integer
# Get the return of to_integer function thanks to $?
score=$((score + $?))

##################################################################
########### Call functions nrj + extract to integer result ###########
nrj
to_integer ${note} # extract car_type note to integer
# Get the return of to_integer function thanks to $?
score=$((score + $?))

##################################################################
########### Call functions km + extract to integer result ###########
km
to_integer ${note} # extract car_type note to integer
# Get the return of to_integer function thanks to $?
score=$((score + $?))

##################################################################
########### Call functions year + extract to integer result ###########
year
to_integer ${note} # extract car_type note to integer
# Get the return of to_integer function thanks to $?
score=$((score + $?))
##################################################################

echo ====================================================================================
echo ====================================================================================
echo "Score: $score/40"
echo ====================================================================================
echo ====================================================================================

##################################################################
########### Call functions + extract to integer result ###########
# Call function borrowing_rates and pass score in parameters
borrowing_rates ${score}

##################################################################
########### Call functions + extract to integer result ###########
# Call function passengers and pass rate in parameters from borrowing_rates function
passengers ${rate}
calculate_percent ${rate} ${percent} # extract percent from number of passenger to sum with rate

##################################################################
echo "L’Emprunteur devra donc payer ${result}% de frais pour cet emprunt"