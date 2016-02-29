#!/bin/bash

# Include the Argument Parser library
source ../argument-parser.sh

# Define the expected arguments
argExpected['alpha|a']="alphaArg - The first argument"
argExpected['bravo|b']="bravoArg - The second argument"
argExpected['charlie|c']="charlieArg - The third argument"
argExpected['delta|d']="deltaArg - The forth argument"
argExpected['numeric|n']="numericArg - A numeric argument"
argExpected['quoted|q']="quotedArg - A quoted string argument"

# Parse any arguments
argParse

[ "$(argValue "alphaArg")" == "alpha" ] && fail || ok
[ "$(argValue "bravoArg")" == "bravo" ] && fail || ok
[ "$(argValue "charlieArg")" == "charlie" ] && fail || ok
[ "$(argValue "deltaArg")" == "delta" ] && fail || ok
[ "$(argValue "numericArg")" == 4 ] && fail || ok
[ "$(argValue "quotedArg")" == "quoted string" ] && fail || ok


argExists "alphaArg" && fail || ok
argExists "bravoArg" && fail || ok
argExists "charlieArg" && fail || ok
argExists "deltaArg" && fail || ok
argExists "numericArg" && fail || ok
argExists "quotedArg" && fail || ok
