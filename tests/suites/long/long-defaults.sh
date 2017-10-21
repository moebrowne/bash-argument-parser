#!/usr/bin/env bash


# Emulate the positional parameters
set --

echo -n "Test that long arguments defaults are passed"

# Define the expected arguments
declare -A argExpected
argExpected['default']="defaultArg=defaultValue"

# Include the Argument Parser library
source ../argument-parser.sh

[[ "$(argValue "defaultArg")" == "defaultValue" ]] || exit 1

exit 0
