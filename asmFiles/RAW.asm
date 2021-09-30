  org   0x0000
  ori   $1,$zero,0xF0

	ori $2, $0, 0x0001
	ori $3, $0, 0x0001
  	ori $5, $0, 0x0002
	addi  $3,$5, 0x1111
	add $6, $5, $3
	sw    $3, 8($1)
	halt

