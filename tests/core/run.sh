#!/usr/bin/env bash

testDir=$(dirname $0)

echo -n " - Long arguments with equals only testing (--long=value):	"
. $testDir/env.sh \
	--alpha=alpha \
	--bravo=bravo \
	--charlie=charlie \
	--delta=delta \
	--numeric=4 \
	--quoted="quoted string" \
	--hyphen-ated=hyphenated
echo

echo -n " - Long arguments without equals only (--long):	 "
. $testDir/env.sh \
	--alpha alpha \
	--bravo bravo \
	--charlie charlie \
	--delta delta \
	--numeric 4 \
	--quoted "quoted string" \
	--hyphen-ated hyphenated
echo

echo -n " - Short arguments without equals only (-s):	"
. $testDir/env.sh \
	-a alpha \
	-b bravo \
	-c charlie \
	-d delta \
	-n 4 \
	-q "quoted string" \
	-h hyphenated
echo
