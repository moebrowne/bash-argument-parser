#!/usr/bin/env bash

# Emulate the positional parameters
#set --

echo -n "Test that descriptions are optional"

# Define the expected arguments
declare -A argExpected
argExpected['alpha']="alphaArg=alphaDefaultValue; "
argExpected['bravo']="bravoArg=bravoDefaultValue"

# Include the Argument Parser library
source ../argument-parser.sh

[[ $(argValue "alphaArg") == "alphaDefaultValue" ]] || exit 1
[[ $(argValue "bravoArg") == "bravoDefaultValue" ]] || exit 1
[[ $() ]]

exit 0
