#!/usr/bin/env bash

echo "Running Tests"

echo "# Core"
./core/run.sh

echo "# Defaults"
./default/run.sh

echo "# Overrides"

echo -n " - Short Override Long	"
./overrides/withDefault.sh --long=unexpected -s expected
./overrides/withDefault.sh --long unexpected -s expected
./overrides/withoutDefault.sh --long=unexpected -s expected
./overrides/withoutDefault.sh --long unexpected -s expected
echo

echo -n " - Long Override Short	"
./overrides/withDefault.sh -s unexpected --long=expected
./overrides/withDefault.sh -s unexpected --long expected
./overrides/withoutDefault.sh -s unexpected --long=expected
./overrides/withoutDefault.sh -s unexpected --long expected
echo
