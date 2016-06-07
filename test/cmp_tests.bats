
@test "Compare files         (JSON)" {
	run ./jsonimp cmp test_one.json test_two.json
	[ "$status" -ne 0 ]
}
