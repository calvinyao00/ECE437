	org   0x0000
  ori   $1,$zero,0xF0
  ori   $2,$zero,0x80
  lw    $3,0($1)
	addi  $3,$5, 0x1111
	halt
	

