.data
  prompt: .asciiz "ingrese un año para saber si es bisiesto o no: "
  es: .asciiz " es un año bisiesto\n"
  noes: .asciiz " no es un año bisiesto\n"
  reset: .asciiz "Quiere repetir el proceso con otro año?(1 para si, 0 para no): "
  offtext: .asciiz "Hasta la proxima!\n"
.text
.globl main
main:
  li $v0, 4
  la $a0, prompt
  syscall
  li $v0, 5
  syscall
  move $t0, $v0
  div $t1, $t0, 4
  mul $t1, $t1, 4
  bne $t0, $t1, noesbisiesto
  div $t1, $t0, 100
  mul $t1, $t1, 100
  bne $t1, $t0, esbisiesto
  div $t1, $t0, 400
  mul $t1, $t1, 400
  bne $t1, $t0, noesbisiesto
esbisiesto:
  li $v0, 1
  move $a0, $t0
  syscall
  li $v0, 4
  la $a0, es
  syscall
  j exit
noesbisiesto:
  li $v0, 1
  move $a0, $t0
  syscall
  li $v0, 4
  la $a0, noes
  syscall
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
