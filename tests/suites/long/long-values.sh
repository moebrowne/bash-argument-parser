#!/usr/bin/env bash

# Emulate the positional parameters
set -- --basic alpha --desc bravo --default charlie --descDefault delta

echo -n "Test that long arguments values can be accessed"

# Define the expected arguments
declare -A argExpected
argExpected['basic']="basicArg"
argExpected['desc']="descArg; This is desc description"
argExpected['default']="defaultArg=defaultValue"
argExpected['descDefault']="descDefaultArg=descDefaultValue; This is descDefault description"

# Include the Argument Parser library
source ../argument-parser.sh

[[ "$(argValue "basicArg")" == "alpha" ]] || exit 1
[[ "$(argValue "descArg")" == "bravo" ]] || exit 1
[[ "$(argValue "defaultArg")" == "charlie" ]] || exit 1
[[ "$(argValue "descDefaultArg")" == "delta" ]] || exit 1

exit 0
