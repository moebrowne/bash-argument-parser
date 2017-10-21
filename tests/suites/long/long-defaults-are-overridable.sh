#!/usr/bin/env bash

# Emulate the positional parameters
set -- --default non-default

echo -n "Test that long arguments defaults can be overridden"

# Define the expected arguments
declare -A argExpected
argExpected['default']="defaultArg=defaultValue"

# Include the Argument Parser library
source ../argument-parser.sh

[[ "$(argValue "defaultArg")" == "non-default" ]] || exit 1

exit 0
