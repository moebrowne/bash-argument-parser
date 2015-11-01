# BASH Argument Parser

Takes arguments passed in nearly any format to a bash script and allows easy access to them and their values

## Use

### How To Use

Just include the library in the head of script and call the parser function

```bash
# Include the Argument Parser library
source ./my/lib/path/argument-parser.sh

# Parse any arguments
argParse
```

### Get An Arguments Value

There is a helper function named `argValue()` which takes the name of 
an argument as its only parameter and returns the value given to the argument.

If the argument doesn't have a value or hasn't been passed nothing is returned.

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

There is a helper function named `argExists()` which takes the name of 
an argument as its only parameter and returns a boolean.

```bash
# -v
if argExists 'v'; then
	echo "The -v argument has been passed"
fi

# -rMd
argExists 'r' && echo "The -r argument was passed"

# --long-argument-name
if argExists 'long-argument-name'; then
	# Do something awesome
fi

# --protocol=HTTP
if argExists 'protocol'; then
	# Do something awesome
fi

# -O 43
argExists 'O' && echo "Found the -O argument"
```

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

```bash
--debug
--test mode0
--test "all the code"
--Case-Sensitive true
--long-parameter
--newline "
"
--1337
--365 "days"
```

### Long Form With Value

```bash
--lang="en"
--crawl=false
--match-pattern=".+"
--newline="
"
--UpperCase=sensitive
--45="25+20"
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
* Calling `my-script.sh -g 345 -g` will mean cause `argValue "g"` to return nothing
* Calling `my-script.sh --size 512 --size=1024` will mean cause `argValue "size"` to return 1024

## Debug Mode

There is a debug mode that can be enabled by setting the `ARG_DEBUG` variable at the top of the script to `true`.
This will cause the script to dump out information about which flags it finds and of what kind etc