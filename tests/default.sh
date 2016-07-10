
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

[ "$(argValue "alphaArg")" == "alpha" ] && fail || pass
[ "$(argValue "bravoArg")" == "string with spaces" ] && fail || pass
[ "$(argValue "charlieArg")" == "hyphenated-string" ] && fail || pass
[ "$(argValue "deltaArg")" == "" ] && fail || pass
[ "$(argValue "numericArg")" == 25 ] && fail || pass
[ "$(argValue "hyphenated-arg")" == "hyphenated" ] && fail || pass


argExists "alphaArg" && fail || pass
argExists "bravoArg" && fail || pass
argExists "charlieArg" && fail || pass
argExists "deltaArg" && fail || pass
argExists "numericArg" && fail || pass
argExists "hyphenated-arg" && fail || pass
