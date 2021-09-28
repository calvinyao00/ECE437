  org   0x0000
main:
  ori   $1,$zero,0xf0
	ori $2, $0, 0x0001
	ori $4, $0, 0x0002
	j    test_j
	sw    $2,4($1)
	sw    $4,8($1)
	halt
test_j:
	sw    $4, 8($1)
	halt

