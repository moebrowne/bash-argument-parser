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