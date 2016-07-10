
# Define the expected arguments
declare -A argExpected
argExpected['alpha|a']="alphaArg - The first argument"
argExpected['bravo|b']="bravoArg - The second argument"
argExpected['charlie|c']="charlieArg - The third argument"
argExpected['delta|d']="deltaArg - The forth argument"
argExpected['numeric|n']="numericArg - A numeric argument"
argExpected['quoted|q']="quotedArg - A quoted string argument"
argExpected['hyphen-ated|h']="hyphenated-arg - A hyphenated argument name"

# Include the Argument Parser library
source ../argument-parser.sh

[ "$(argValue "alphaArg")" == "alpha" ] && pass || fail
[ "$(argValue "bravoArg")" == "bravo" ] && pass || fail
[ "$(argValue "charlieArg")" == "charlie" ] && pass || fail
[ "$(argValue "deltaArg")" == "delta" ] && pass || fail
[ "$(argValue "numericArg")" == 4 ] && pass || fail
[ "$(argValue "quotedArg")" == "quoted string" ] && pass || fail
[ "$(argValue "hyphenated-arg")" == "hyphenated" ] && pass || fail


argExists "alphaArg" && pass || fail
argExists "bravoArg" && pass || fail
argExists "charlieArg" && pass || fail
argExists "deltaArg" && pass || fail
argExists "numericArg" && pass || fail
argExists "quotedArg" && pass || fail
argExists "hyphenated-arg" && pass || fail
