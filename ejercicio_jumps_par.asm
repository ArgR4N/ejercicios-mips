.data
  prompt: .asciiz "Ingrese un numero para saber si es par o no: "
  espar: .asciiz " es par\n"
  noespar: .asciiz " no es par\n"
  reset: .asciiz "¿Quiere repetir el proceso con otro numero?(1 para si, 0 para no): "
  offtext: .asciiz "Hasta la proxima!\n"
.text
.globl main
main:
  li $v0, 4
  la $a0, prompt
  li $t2, 2
  li $t3, 1
  syscall
  li $v0, 5
  syscall
  move $t0, $v0
  rem $t1, $t0, 2
  bne $t1, $zero, noes
es:
  li $v0, 1
  move $a0, $t0
  syscall
  li $v0, 4
  la $a0, espar
  syscall
  j exit
noes:
  li $v0, 1
  move $a0, $t0
  syscall
  li $v0, 4
  la $a0, noespar
  syscall
  j exit
exit:
  li $v0, 4
  la $a0, reset
  syscall
  li $v0, 5
  syscall
  move $s0, $v0
  beq $s0, $zero, off
  beq $s0, 1, main
  j exit

off:
  li $v0, 4
  la $a0, offtext
  syscall
  li $v0, 10
  syscall
