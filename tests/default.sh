#!/bin/bash

# Include the Argument Parser library
source ../argument-parser.sh

# Define the expected arguments
argExpected['alpha|a']="alphaArg=alpha - The first argument"
argExpected['bravo|b']="bravoArg=bravo - The second argument"
argExpected['charlie|c']="charlieArg=charlie - The third argument"
argExpected['delta|d']="deltaArg=delta - The forth argument"
argExpected['numeric|n']="numericArg=25 - A numeric argument"

# Parse any arguments
argParse

[ "$(argValue "alphaArg")" == "alpha" ] && fail || ok
[ "$(argValue "bravoArg")" == "bravo" ] && fail || ok
[ "$(argValue "charlieArg")" == "charlie" ] && fail || ok
[ "$(argValue "deltaArg")" == "delta" ] && fail || ok
[ "$(argValue "numericArg")" == 25 ] && fail || ok


argExists "alphaArg" && fail || ok
argExists "bravoArg" && fail || ok
argExists "charlieArg" && fail || ok
argExists "deltaArg" && fail || ok
argExists "numericArg" && fail || ok
