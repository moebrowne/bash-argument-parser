#!/usr/bin/env bash

pass() {
	echo -en "\033[31m\xE2\x80\xA2\033[0m"
}

fail() {
	echo -en "\033[32m\xE2\x80\xA2\033[0m"
}

echo "Running Tests"

echo -n "- Long arguments with equals only:	"
. simple.sh \
	--alpha=alpha \
	--bravo=bravo \
	--charlie=charlie \
	--delta=delta \
	--numeric=4 \
	--quoted="quoted string" \
	--hyphen-ated=hyphenated
echo

echo -n "- Long arguments without equals only:	"
. simple.sh \
	--alpha alpha \
	--bravo bravo \
	--charlie charlie \
	--delta delta \
	--numeric 4 \
	--quoted "quoted string" \
	--hyphen-ated hyphenated
echo

echo -n "- Long arguments overriding short arguments:	"
. simple.sh \
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

echo -n "- Short arguments without equals only:	"
. simple.sh \
	-a alpha \
	-b bravo \
	-c charlie \
	-d delta \
	-n 4 \
	-q "quoted string" \
	-h hyphenated
echo

echo -n "- Short arguments overriding long arguments:	"
. simple.sh \
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







echo -n "- Default values:	"
. default.sh
echo
