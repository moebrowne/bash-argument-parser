
source tools.sh

# Define the expected arguments
declare -A argExpected
argExpected['alpha|a']="alphaArg; The first argument"
argExpected['bravo|b']="bravoArg; The second argument"
argExpected['charlie|c']="charlieArg; The third argument"
argExpected['delta|d']="deltaArg; The forth argument"
argExpected['numeric|n']="numericArg; A numeric argument"
argExpected['quoted|q']="quotedArg; A quoted string argument"
argExpected['hyphen-ated|h']="hyphenated-arg; A hyphenated argument name"

# Include the Argument Parser library
source ../argument-parser.sh

[ "$(argValue "alphaArg")" == "alpha" ] && pass || fail
[ "$(argValue "bravoArg")" == "bravo" ] && pass || fail
[ "$(argValue "charlieArg")" == "charlie" ] && pass || fail
[ "$(argValue "deltaArg")" == "delta" ] && pass || fail
[ "$(argValue "numericArg")" == 4 ] && pass || fail
[ "$(argValue "quotedArg")" == "quoted string" ] && pass || fail
[ "$(argValue "hyphenated-arg")" == "hyphenated" ] && pass || fail


argPassed "alphaArg" && pass || fail
argPassed "bravoArg" && pass || fail
argPassed "charlieArg" && pass || fail
argPassed "deltaArg" && pass || fail
argPassed "numericArg" && pass || fail
argPassed "quotedArg" && pass || fail
argPassed "hyphenated-arg" && pass || fail
