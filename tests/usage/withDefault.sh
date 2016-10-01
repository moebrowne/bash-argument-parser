source tools.sh

echo -n '['

# Define the expected arguments
declare -A argExpected
argExpected['alpha']="alpha=defaultValue - Long argument with default"
argExpected['bravo']="bravo - Long argument without default"
argExpected['a']="alphaShort=defaultValue - Short argument with default"
argExpected['b']="bravoShort - Short argument without default"
argExpected['charlie|c']="charlie - Short and long argument without default"
argExpected['delta|d']="delta=defaultValue - Short and long argument with default"

# Include the Argument Parser library
source ../argument-parser.sh

IFS='' usageActual="$(argList)"

usageExpected="ARGUMENT SUMMARY:
	$(tput bold)--delta -d$(tput sgr0)
		Short and long argument with default (default: 'defaultValue')

	$(tput bold)--bravo$(tput sgr0)
		Long argument without default

	$(tput bold)--alpha$(tput sgr0)
		Long argument with default (default: 'defaultValue')

	$(tput bold)-a$(tput sgr0)
		Short argument with default (default: 'defaultValue')

	$(tput bold)-b$(tput sgr0)
		Short argument without default

	$(tput bold)--charlie -c$(tput sgr0)
		Short and long argument without default"

[ "$usageActual" == "$usageExpected" ] && pass || fail

echo -n '] '