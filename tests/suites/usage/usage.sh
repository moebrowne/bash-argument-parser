#!/usr/bin/env bash

echo -n "Test that usage shows the correct output"

# Define the expected arguments
declare -A argExpected
argExpected['alpha']="alpha=defaultValue; Long argument with default"
argExpected['bravo']="bravo; Long argument without default"
argExpected['a']="alphaShort=defaultValue; Short argument with default"
argExpected['b']="bravoShort; Short argument without default"
argExpected['charlie|c']="charlie; Short and long argument without default"
argExpected['delta|d']="delta=defaultValue; Short and long argument with default"
argExpected['echo']="echo=defaultValue;"

# Include the Argument Parser library
source ../argument-parser.sh

IFS='' usageActual="$(argList)"

usageExpected="ARGUMENT SUMMARY:
	$(tput bold)--delta -d$(tput sgr0)
		Short and long argument with default (default: 'defaultValue')

	$(tput bold)--bravo$(tput sgr0)
		Long argument without default

	$(tput bold)--echo$(tput sgr0)
		 (default: 'defaultValue')

	$(tput bold)--alpha$(tput sgr0)
		Long argument with default (default: 'defaultValue')

	$(tput bold)-a$(tput sgr0)
		Short argument with default (default: 'defaultValue')

	$(tput bold)-b$(tput sgr0)
		Short argument without default

	$(tput bold)--charlie -c$(tput sgr0)
		Short and long argument without default

	$(tput bold)--help -h$(tput sgr0)
		Show this help message"

[ "$usageActual" != "$usageExpected" ] && exit 1

exit 0