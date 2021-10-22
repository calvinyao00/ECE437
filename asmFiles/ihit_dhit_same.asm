  org   0x0000
  ori   $1,$zero,0xF0
  ori   $2,$zero,0xF0
  ori   $3,$zero,0x04
  ori   $4,$zero,0x01

loop:
  subu  $3,$3,$4
  sw    $3,8($2)
  bne $0, $3, loop
finish:
  halt