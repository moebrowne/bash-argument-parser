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

[ "$(argValue "alphaArg")" == "alpha" ] && fail || pass
[ "$(argValue "bravoArg")" == "bravo" ] && fail || pass
[ "$(argValue "charlieArg")" == "charlie" ] && fail || pass
[ "$(argValue "deltaArg")" == "delta" ] && fail || pass
[ "$(argValue "numericArg")" == 25 ] && fail || pass


argExists "alphaArg" && fail || pass
argExists "bravoArg" && fail || pass
argExists "charlieArg" && fail || pass
argExists "deltaArg" && fail || pass
argExists "numericArg" && fail || pass
