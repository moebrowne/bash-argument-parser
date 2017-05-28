source tools.sh

echo -n '['

# Define the expected arguments
declare -A argExpected
argExpected['long|s']="arg; The first argument"

# Include the Argument Parser library
source ../argument-parser.sh

[ "$(argValue "arg")" == "expected" ] && pass || fail

argPassed "arg" && pass || fail

echo -n '] '