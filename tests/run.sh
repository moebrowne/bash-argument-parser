#!/usr/bin/env bash

echo "Running Tests"

testsPass=0
testsFail=0

for test in $(find ./suites -type f)
do
    output=$("./$test")
    if [[ $? -eq 0 ]]; then
        echo -e "\e[42m\e[30m PASS \e[0m $output"
        ((testsPass++))
    else
        echo -e "\e[41m\e[30m\e[1m FAIL \e[0m $output"
        ((testsFail++))
    fi
done

testsTotal=$((testsPass+testsFail));

echo

if [[ "$testsFail" != 0 ]]; then
    echo -en "\e[41m\e[30m\e[1m FAILURES \e[0m"
else
    echo -en "\e[42m\e[30m OKAY \e[0m"
fi

echo " (Tests: ${testsTotal}, Failures: ${testsFail})"

if [[ "$testsFail" != 0 ]]; then
    exit 1
fi

exit 0
