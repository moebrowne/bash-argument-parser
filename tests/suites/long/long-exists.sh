#!/usr/bin/env bash

# Emulate the positional parameters
set -- --basic --desc --default --descDefault

echo -n "Test that long arguments exist"

# Define the expected arguments
declare -A argExpected
argExpected['basic']="basicArg"
argExpected['desc']="descArg; This is desc description"
argExpected['default']="defaultArg=defaultValue"
argExpected['descDefault']="descDefaultArg=descDefaultValue; This is descDefault description"

# Include the Argument Parser library
source ../argument-parser.sh

argPassed "basicArg" || exit 1
argPassed "descArg" || exit 1
argPassed "defaultArg" || exit 1
argPassed "descDefaultArg" || exit 1

exit 0
