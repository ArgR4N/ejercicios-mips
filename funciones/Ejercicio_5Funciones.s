.data
  prompt: .asciiz "ingrese un numero para hacer su factorial: "
  text: .asciiz "el factorial del numero es: "

.text
.globl main
main:
  li $v0, 4
  la $a0,prompt 
  syscall #Print Input
  li $v0,5
  syscall #Input
  move $a0, $v0 #Input a a0
  li $s0, 1 #setea s0 en 1
  jal loop
  move $a0, $v0
  li $v0, 1
  syscall
  j exit

loop:
  beq $a0, $zero, return
  mul $s0, $s0, $a0
  addi $a0, $a0, -1
  j loop

return:
  move $v0, $s0 
  jr $ra

exit:
  li $v0,10
  syscall
