  org   0x0000
  ori   $1,$zero,0xF0
  ori   $2,$zero,0x80
  ori   $3,$zero,0xA0
  lw    $3,0($1)
  lw    $3,0($2)
  lw    $3,0($3)
  sw    $3,0($1)
  sw    $3,0($2)
  addi  $3,$3, 0x1111
  halt