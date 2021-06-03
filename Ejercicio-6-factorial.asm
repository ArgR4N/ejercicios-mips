.data
  line: .asciiz "\n"
  prompt: .asciiz "ingrese un numero para hacer su factorial: "
  text: .asciiz "el factorial del numero es: "
  reset: .asciiz "quiere hacer otro factorial?(0 para no, 1 para si): "
  termina: .asciiz "hasta la proxima!"

.text
.globl main
main:
  li $t0, 1
  li $v0, 4
  la $a0,prompt
  syscall
  li $v0,5
  syscall
  move $t1, $v0
  bne $t1, $zero, loop
  li $v0, 4
  la $a0, text
  syscall
  li $v0, 1
  li $a0, 1
  syscall
  li $v0, 4
  la $a0, line
  syscall
  li $v0, 4
  la $a0, reset
  syscall
  li $v0, 5
  syscall
  move $s0, $v0
  beq $s0, 1, main
  li $v0, 4
  la $a0, termina
  syscall
  j exit

loop:
  beq $t1, $zero, final
  mul $t0, $t0, $t1
  addi $t1, $t1, -1
  j loop

final:
  li $v0, 4
  la $a0, text
  syscall
  move $a0, $t0
  li $v0, 1
  syscall
  li $v0, 4
  la $a0, line
  syscall
  li $v0, 4
  la $a0, reset
  syscall
  li $v0, 5
  syscall
  move $s0, $v0
  beq $s0, 1, main
  li $v0, 4
  la $a0, termina
  syscall
  j exit

exit:
  li $v0,10
  syscall
