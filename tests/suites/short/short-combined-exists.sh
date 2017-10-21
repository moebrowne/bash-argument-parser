#!/usr/bin/env bash

# Emulate the positional parameters
set -- -bdeg

echo -n "Test that combined short arguments exist"

# Define the expected arguments
declare -A argExpected
argExpected['b']="basicArg"
argExpected['d']="descArg; This is desc description"
argExpected['e']="defaultArg=defaultValue"
argExpected['g']="descDefaultArg=descDefaultValue; This is descDefault description"

# Include the Argument Parser library
source ../argument-parser.sh

argPassed "basicArg" || exit 1
argPassed "descArg" || exit 1
argPassed "defaultArg" || exit 1
argPassed "descDefaultArg" || exit 1

exit 0
