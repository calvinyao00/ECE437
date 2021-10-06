  org 0x0000

  ori   $29, $0, 0xFFFC
  pop   $2 
 pop   $3 
  ori   $4, $0, 0x1 

loop: 
  and $5, $2, $4 
  beq $5, $0, next
  add $6, $6, $3
next:
  sllv $3, $4, $3
  srlv $2, $4, $2
  addi $7, $7, 1
  ori  $5, $0, 32
  slt  $5, $7, $5
  beq  $5, $4, loop
done:
  push  $6
  halt
