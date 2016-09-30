#!/usr/bin/env bash

testDir=$(dirname $0)

echo -n " - Long arguments with equals only:	"
. $testDir/env.sh \
	--alpha=alpha \
	--bravo=bravo \
	--charlie=charlie \
	--delta=delta \
	--numeric=4 \
	--quoted="quoted string" \
	--hyphen-ated=hyphenated
echo

echo -n " - Long arguments without equals only:	"
. $testDir/env.sh \
	--alpha alpha \
	--bravo bravo \
	--charlie charlie \
	--delta delta \
	--numeric 4 \
	--quoted "quoted string" \
	--hyphen-ated hyphenated
echo

echo -n " - Long arguments overriding short arguments:	"
. $testDir/env.sh \
	-a badoption \
	--alpha=alpha \
	-b badoption \
	--bravo=bravo \
	-c badoption \
	--charlie=charlie \
	-d badoption \
	--delta=delta \
	-n badoption \
	--numeric=4 \
	-q "quoted string" \
	-h badoption \
	--hyphen-ated hyphenated
echo

echo -n " - Short arguments without equals only:	"
. $testDir/env.sh \
	-a alpha \
	-b bravo \
	-c charlie \
	-d delta \
	-n 4 \
	-q "quoted string" \
	-h hyphenated
echo

echo -n " - Short arguments overriding long arguments:	"
. $testDir/env.sh \
	--alpha=badoption \
	-a alpha \
	--bravo=badoption \
	-b bravo \
	--charlie=badoption \
	-c charlie \
	--delta=badoption \
	-d delta \
	--numeric=badoption \
	-n 4 \
	-q "quoted string" \
	--hyphen-ated=badoption \
	-h hyphenated
echo
