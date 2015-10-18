# BASH Argument Parser

Takes arguments passed in nearly any format to a bash script and allows easy access to them and their values

## Use

### Get An Arguments Value

Get the value of the `--debug 3` flag

```bash
	DEBUG="${args['debug']}" # 3
```

### Check If An Argument Has Been Passed

Check for the `-v` flag

```bash
	if argExists 'v'; then
    	echo "The -v flag has been passed"
    fi
    
    # Or
    
    argExists 'v' && echo "Verbosity Enabled"
```

Check for the `--test` flag

```bash
	if argExists 'test'; then
    	echo "The --test flag has been passed"
    fi
    
    # Or
    
    argExists 'test' && echo "Testing enabled"
```

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