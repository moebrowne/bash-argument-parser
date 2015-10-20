#!/bin/bash

# Define the regex for matching the arguments
regexArgShort='^-([a-zA-Z0-9])$'
regexArgShortChained='^-([a-zA-Z0-9]{2,})$'
regexArgLong='^--([a-zA-Z0-9\-]{2,})$'
regexArgLongWithValue='^--([a-zA-Z0-9\-]{2,})=(.*)$'

argChunks=()

ARG_DEBUG=false

# Expand chained short form arguments, eg -aih => -a -i -h
for argChunk in "$@"; do

	# See if this argument is a chained short form argument
	[[ $argChunk =~ $regexArgShortChained ]]
	if [ "${BASH_REMATCH[1]}" != "" ]; then

		# Get the chunk or arguments
		chainedChunk="${BASH_REMATCH[1]}";

		[ $ARG_DEBUG == true ] && echo "Expanding chained argument chunk: $chainedChunk"

		i=0
		# Expand out the chunk into individual arguments
		while (( i++ < ${#chainedChunk} )); do

			# Get just the argument on its own
			argumentIsolated="${chainedChunk:$i-1:1}"

			# Add the isolated argument to the argument chunk array
			argChunks+=("-$argumentIsolated")
		done
		continue;
	fi

	# Add the argument to the argument array
	argChunks+=("$argChunk")
done

[ $ARG_DEBUG == true ] && echo "Expanded argument list: ${argChunks[@]}"

# Initialise some variables
declare -A argv
lastWasArgument=0
lastArgument=""

# Loop over all the argument chunks and determine if the argument type and value
for argChunk in "${argChunks[@]}"; do

	# Check if this chunk is a short form argument
	[[ $argChunk =~ $regexArgShort ]]
	if [ "${BASH_REMATCH[1]}" != "" ]; then
		argument="${BASH_REMATCH[1]}"
		lastWasArgument=1
		lastArgument="$argument"

		# Add the argument to the arguments array
		argv["${BASH_REMATCH[1]}"]=''

		[ $ARG_DEBUG == true ] && echo "Argument (short): ${BASH_REMATCH[1]}"

		continue;
	fi

	# Check if this chunk is a long form with value argument
	[[ $argChunk =~ $regexArgLongWithValue ]]
	if [ "${BASH_REMATCH[1]}" != "" ]; then
		argument="${BASH_REMATCH[1]}"
		lastArgument="$argument"

		# Add the argument to the arguments array
		argv["${BASH_REMATCH[1]}"]="${BASH_REMATCH[2]}"

		[ $ARG_DEBUG == true ] && echo "Argument (long with value): ${BASH_REMATCH[1]}=${BASH_REMATCH[2]}"

		continue;
	fi

	# Check if this chunk is a long form argument
	[[ $argChunk =~ $regexArgLong ]]
	if [ "${BASH_REMATCH[1]}" != "" ]; then
		argument="${BASH_REMATCH[1]}"
		lastWasArgument=1
		lastArgument="$argument"

		# Add the argument to the arguments array
		argv["${BASH_REMATCH[1]}"]=''

		[ $ARG_DEBUG == true ] && echo "Argument (long): ${BASH_REMATCH[1]}"

		continue;
	fi

	# If the last chunk was an argument and this wasn't assume its an argument value
	if [ $lastWasArgument == 1 ]; then

		# Add the arguments value to the arguments array
		argv["$lastArgument"]="$argChunk"

		[ $ARG_DEBUG == true ] && echo "Argument Value: $argChunk"

		lastWasArgument=0
	fi
done

[ $ARG_DEBUG == true ] && echo "Argument array:"
[ $ARG_DEBUG == true ] && for k in "${!argv[@]}"
do
    echo "ARG: $k = ${argv[$k]}"
done

argExists() {
	if [ -z ${argv["$1"]+abc} ]; then
		return 1
	else
		return 0
	fi
}

argValue() {
	if argExists "$1"; then
		echo "${argv["$1"]}"
	fi
}

# Add the standard argc variable containing the number of arguments
argc=${#argv[@]}
