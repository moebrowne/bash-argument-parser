#!/usr/bin/env bash

echo "Running Tests"

for test in $(find ./suites -type f)
do
    output=$("./$test")
    if [[ $? -eq 0 ]]; then
        echo -e "\e[42m\e[30m PASS \e[0m $output"
    else
        echo -e "\e[41m\e[30m\e[1m FAIL \e[0m $output"
    fi
done
