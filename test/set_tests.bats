
test_one_json_42='{
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
}'

test_one_json_languages_c_to_d='{
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
}'

test_one_json_languages_push_d='{
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
}'



@test "Set '@id'             (JSON)" {
	result="$(./jsonimp test_one.json '@id' -s 42)"
	[ "$result" = "$test_one_json_42" ]
}

@test "Set 'languages[1]'    (JSON)" {
	result="$(./jsonimp test_one.json languages[1] -s 'D')"
	[ "$result" = "$test_one_json_languages_c_to_d" ]
}

@test "Push 'languages' 'D'  (JSON)" {
  result="$(./jsonimp test_one.json 'languages' -push 'D')"
  [ "$result" = "$test_one_json_languages_push_d" ]
}

