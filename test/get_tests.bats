
test_one_json='{
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
}'

test_one_json_languages='[
  "BASH",
  "C",
  "Go",
  "Node",
  "Rust"
]'


@test "Get 'test_one.json'   (JSON)" {
	result="$(jsonimp test_one.json)"
	[ "$result" = "$test_one_json" ]
}

@test "Get '@id'             (JSON)" {
	result="$(jsonimp test_one.json -g '@id')"
	[ $result -eq 69 ]
}

@test "Get 'name'            (JSON)" {
	result="$(jsonimp get test_one.json name)"
	[ "$result" = '"RuneImp"' ]
}

@test "Get 'name'            (raw)" {
	result="$(jsonimp test_one.json -r name)"
	[ "$result" = 'RuneImp' ]
}

@test "Get 'languages'       (JSON)" {
	result="$(jsonimp test_one.json -g languages)"
	[ "$result" = "$test_one_json_languages" ]
}

@test "Get 'languages[1]'    (raw)" {
	result="$(jsonimp test_one.json -r languages[1])"
	[ "$result" = 'C' ]
}

