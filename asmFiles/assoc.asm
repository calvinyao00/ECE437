  org   0x0000
  ori   $1,$zero,0xF0
  ori   $2,$zero,0x70
  ori   $3,$zero,0x30
  lw    $4,0($1)
  lw    $4,0($2)
  lw    $4,0($3)
  sw    $4,0($2)
  sw    $4,0($3)
  addi  $3,$3, 0x1111
  halt
