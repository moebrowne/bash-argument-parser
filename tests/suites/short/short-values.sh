#!/usr/bin/env bash

# Emulate the positional parameters
set -- -a alpha -b bravo -c charlie -d delta

echo -n "Test that short arguments values can be accessed"

# Define the expected arguments
declare -A argExpected
argExpected['a']="basicArg"
argExpected['b']="descArg; This is desc description"
argExpected['c']="defaultArg=defaultValue"
argExpected['d']="descDefaultArg=descDefaultValue; This is descDefault description"

# Include the Argument Parser library
source  ../argument-parser.sh

[[ $(argValue "basicArg") -eq "alpha" ]] || exit 1
[[ $(argPassed "descArg") -eq "bravo" ]] || exit 1
[[ $(argPassed "defaultArg") -eq "charlie" ]] || exit 1
[[ $(argPassed "descDefaultArg") -eq "delta" ]] || exit 1

exit 0
