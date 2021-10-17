#---------------------------------------
# mult_procedure asm file for alu
#---------------------------------------

# set the address where you want this
# code segment
  org 0x0000

  ori   $29, $0, 0xFFFC
  ori   $2, $0, 31
  ori   $3, $0, 10
  ori   $4, $0, 16
  push  $2
  push  $3
  push  $4
  jal mult
  jal mult
  halt

mult:
  pop   $2 
  pop   $3 
  ori   $4, $0, 0x1 
  ori   $6, $0, 0
  ori   $7, $0, 0 
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
  jr $31
  

