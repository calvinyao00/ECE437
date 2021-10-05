  org   0x0000
  ori   $1,$zero,0xF0

	ori $2, $0, 0x0001
	ori $3, $0, 0x0001
  ori $5, $0, 0x0002
first:
	beq $3, $2, correct
	sw    $3,0($1)
	halt
correct:
	sw    $5,0($1)
	halt
