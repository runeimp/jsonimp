JSONimp
=======

A simple JSON manipulation tool to more easily manage certain scripting tasks on the command line. It is currently a wrapper for [jq][] which is an excellent tool for manipulating JSON and is a language unto itself. The wrapper allows for a simplified syntax when the full power of a tool like [jq][] is unnecessary.


Usage
-----

### Pretty Print the contents of a JSON file.

```
$ jsonimp test_one.json
{
  "@id": 69,
  "name": "RuneImp",
  "goblin": true,
  "shapeshifter": true,
  "languages": [
    "BASH",
    "C",
    "Go",
    "Node",
    "Rust"
  ]
}
```

### Get the JSON value of the `name` key.

```
$ jsonimp get test_one.json name
"RuneImp"
```

### Get the raw value (unwraps strings) of the `name` key.

```
$ jsonimp test_one.json -r name
RuneImp
```

### Get the value at index `1` for the `languages` key.

```
$ jsonimp test_one.json -g languages[1]
"C"
```

### Set the value of the '@id' key.

```
$ jsonimp test_one.json '@id' -s 42
{
  "@id": 42,
  "name": "RuneImp",
  "goblin": true,
  "shapeshifter": true,
  "languages": [
    "BASH",
    "C",
    "Go",
    "Node",
    "Rust"
  ]
}
```

### Set the value at index `1` of the `languages` array.

```
$ jsonimp test_one.json languages[1] -s 'D'
{
  "@id": 69,
  "name": "RuneImp",
  "goblin": true,
  "shapeshifter": true,
  "languages": [
    "BASH",
    "D",
    "Go",
    "Node",
    "Rust"
  ]
}
```

### Push `D` on the the `languages` array.

```
$ jsonimp test_one.json 'languages' -push 'D'
{
  "@id": 69,
  "name": "RuneImp",
  "goblin": true,
  "shapeshifter": true,
  "languages": [
    "BASH",
    "C",
    "Go",
    "Node",
    "Rust",
    "D"
  ]
}
```

### Compare two JSON files

```
$ jsonimp cmp test_one.json test_two.json && echo '==' || echo '!='
!=
# -or-
$ jsonimp cmp test_one.json test_two.json; echo $?
1
# -or-
$ jsonimp cmp test_one.json test_one.json; echo $?
0
```

### Update In-Place

```
$ cp test_one.json test_one.bak.json
$ jsonimp test_one.bak.json '@id' -s 42 -i
$ jsonimp test_one.bak.json 
{
  "@id": 42,
  "name": "RuneImp",
  "goblin": true,
  "shapeshifter": true,
  "languages": [
    "BASH",
    "C",
    "Go",
    "Node",
    "Rust"
  ]
}
```


[jq]: https://stedolan.github.io/jq/


