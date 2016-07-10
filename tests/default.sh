
# Define the expected arguments
declare -A argExpected
argExpected['alpha|a']="alphaArg=alpha - The first argument"
argExpected['bravo|b']="bravoArg=string with spaces - The second argument"
argExpected['charlie|c']="charlieArg=hyphenated-string - The third argument"
argExpected['delta|d']="deltaArg= - The forth argument"
argExpected['numeric|n']="numericArg=25 - A numeric argument"
argExpected['hyphen-ated|h']="hyphenated-arg=hyphenated - A hyphenated argument name"

# Include the Argument Parser library
source ../argument-parser.sh

[ "$(argValue "alphaArg")" == "alpha" ] && pass || fail
[ "$(argValue "bravoArg")" == "string with spaces" ] && pass || fail
[ "$(argValue "charlieArg")" == "hyphenated-string" ] && pass || fail
[ "$(argValue "deltaArg")" == "" ] && pass || fail
[ "$(argValue "numericArg")" == 25 ] && pass || fail
[ "$(argValue "hyphenated-arg")" == "hyphenated" ] && pass || fail


argExists "alphaArg" && fail || pass
argExists "bravoArg" && fail || pass
argExists "charlieArg" && fail || pass
argExists "deltaArg" && fail || pass
argExists "numericArg" && fail || pass
argExists "hyphenated-arg" && fail || pass
