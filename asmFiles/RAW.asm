  org   0x0000
  ori   $1,$zero,0xF0

	ori $2, $0, 0x0001
	ori $3, $0, 0x0001
  	ori $5, $0, 0x0002
	sw    $5, 8($1)
	addi  $3,$5, 0x1111
	halt

