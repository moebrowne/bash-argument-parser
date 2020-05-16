![Travis Build](https://api.travis-ci.org/moebrowne/bash-argument-parser.svg?branch=develop)

# BASH Argument Parser

Takes arguments passed to a bash script in nearly any format and allows easy access to them and their values

## Use

### How To Use

Just define all the arguments you need and include the library in the head of script, that's it.

```bash
# Define the expected arguments
declare -A argExpected
argExpected['test']="argName; This is a short description of the argument and what it does"
argExpected['R']="secondArgName; This is another argument that can be passed"

# Include and run the Argument Parser library
source ./my/lib/path/argument-parser.sh
```

### Defining Expected Arguments

The argument parser takes an array of arguments to expect, it has the following format:

```bash
# Define argExpected as an associative array
# This must occur once before you build the array of argument definitions
declare -A argExpected

# Define the -r argument
argExpected['r']="argumentName; Argument description"

# Define the --test argument
argExpected['test']="argumentName; Argument description"

# Define both the -u and --uniform arguments
argExpected['u|uniform']="argumentName; Argument description"

# Define both the -a and -A arguments
argExpected['a|A']="argumentName; Argument description"

# Define the -d, --deamon and -D arguments
argExpected['d|deamon|D']="argumentName; Argument description"
```

The `argumentName` part of the definition is the name given to the argument and what should be passed to the `argValue` and `argPassed` functions, see below. The argument name is case sensitive and must not contain spaces or an equals sign.

By default if an argument is passed that hasn't been defined an error will be thrown and the script will exit.
This feature can be turned off by setting `ARG_MUST_BE_DEFINED` to `false`, note that the argument names will default to the argument its self, without the preceding hyphen(s).

### Defining Argument Default Values

You can define a default value that will be used if the argument isn't passed:
 
```bash
# Set the -e arguments default value to 900 
argExpected['e']="argumentName=900; Argument description"
```

Now if the script is called and the `-e` argument is omitted `argValue "argumentName"` will return `900`
The default value can also be set to an empty string (`argExpected['e']="argumentName=; Argument description"`)

### Get An Arguments Value

There is a helper function named `argValue()` which takes the name of 
an argument as its only parameter and returns the value given to the argument.

If the argument doesn't have a value or hasn't been passed nothing is returned 
unless it's been given a default, in which case the default value will be returned.

```bash
# -a 'some text'
if [ "$(argValue "a")" == 'some text' ]; then
	# Do something awesome
fi

# --debug 3
DEBUG_LEVEL="$(argValue "debug")" # 3

# --max-size=1024
MAX_SIZE="$(argValue "max-size")" # 1024

# -R 0
[ "$(argValue "R")" == "0" ] && echo "Recursive depth 0"

# -aXb 'cookie'
BISCUIT="$(argValue "b")" # 'cookie'

# -g 'hello' -G 'world'
ALPHA="$(argValue "g")" # 'hello'
BRAVO="$(argValue "G")" # 'world'

# -S d
case $(argValue 'S') in
	a)	echo "something" ;;
	b)	echo "something" ;;
	c)	echo "something" ;;
	d)	echo "darkside"  ;;
esac
```

### Check If An Argument Has Been Passed

There is a helper function named `argPassed` which takes the name of 
an argument as its only parameter and returns a boolean.

`argPassed` will return false if the argument has fallen back to its default value*

```bash
# -v
if argPassed 'v'; then
	echo "The -v argument has been passed"
fi

# -rMd
argPassed 'r' && echo "The -r argument was passed"

# --long-argument-name
if argPassed 'long-argument-name'; then
	# Do something awesome
fi

# --protocol=HTTP
if argPassed 'protocol'; then
	# Do something awesome
fi

# -O 43
argPassed 'O' && echo "Found the -O argument"
```

## Help Output

By default the library adds `-h` and `--help` arguments which when passed prints a usage message.
This behaviour can be disabled by setting `ARG_HELP_DISABLED` to `true`

## Supported Argument Formats

### Short Form

```bash
-a
-X
-2
-b somevalue
-c 38
-d "some value with spaces"
-e "some value with
newlines"
-7 "ate nine"
```

### Long Form

The value of long form arguments can be delimited by either an `=` or a space

```bash
--debug
--test
--Case-Sensitive
--long-parameter
--verbose 3
--1337
--lang="en"
--crawl=false
--test "all the code"
--match-pattern=".+"
--newline="
"
--UpperCase=sensitive
--45="25+20"
--365 "days"
```

### Chained Short Form Arguments

```bash
-aih	# Equivalent to -a -i -h
-dav 4	# Equivalent to -d -a -v 4
-H3cx	# Equivalent to -H -3 -c -x
```

## Argument Order

The order the arguments are passed on the command line makes a difference

### Examples

* Calling `my-script.sh -f first -f last` will cause `argValue "f"` to return the value `last`
* Calling `my-script.sh -g 345 -g` will cause `argValue "g"` to return nothing
* Calling `my-script.sh --size 512 --size=1024` will cause `argValue "size"` to return `1024`

## Passing Additional Non-Arguments Strings

If you need to pass in non-argument stings along side your arguments you just need to add the end of arguments marker `--` and anything that follows wont be parsed as an argument but instead will be assigned to a numbered positional argument:

For example running: `./script.sh --arg1 --arg2 -- file1 file2 -f file5`

Will be parsed as:

* Argument: `--arg1`
* Argument: `--arg2`
* Non-Argument: `file1` (accessible via `$1`)
* Non-Argument: `file2` (accessible via `$2`)
* Non-Argument: `-f` (accessible via `$3`)
* Non-Argument: `file5` (accessible via `$4`)

This way you can define arguments along side an arbitrary number of strings you may want to operate on at the same time!

## Debug Mode

There is a debug mode that can be enabled by setting the `ARG_DEBUG` variable to `true` right before including the library.
This will cause the script to dump out information about which flags it finds and of what kind etc

## Testing

There is a rudimentary test suite included with the project that can be used to check that changes haven't broken any other part of the code.

### Running Tests

It's as simple as executing `test.sh` in the `tests` directory, if you see any red blips there is a problem, if it's all green then everything should be ok

## Configuration

There are a couple of flags that can be set to adjust how the parser works

- `ARG_DEBUG`: show debug information
- `ARG_HELP_DISABLED`: disable the default `-h`/`--help` usage argument