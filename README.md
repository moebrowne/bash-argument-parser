# BASH Argument Parser

Takes arguments passed in nearly any format to a bash script and allows easy access to them and their values

## Supported Argument Formats

### Short Form

```bash
	-a
	-X
	-b somevalue
	-c 38
	-d "some value with spaces"
	-e "some value with
newlines"
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
```

### Chained Short Form Arguments

```bash
	-aih	# Equivalent to -a -i -h
	-dav 4	# Equivalent to -d -a -v 4
```

## Argument Order

The order the arguments are passed on the command line makes a difference

### Examples

* Calling `my-script.sh -f first -f last` will cause `${args["f"]}` to have the value `last`
* Calling `my-script.sh -g 345 -g` will mean cause `${args["g"]}` to be blank