.data
  parar: .asciiz "Para detenr el programa ingrese 0\n"
  texto: .asciiz "Ingrese un numero para sumar al promedio: "
  resultado: .asciiz "El resultado es: "
  promedio: .asciiz "El promedio de los numeros es: "
  reset: .asciiz "Quiere hacer otra suma?(1 para si, 0 para no): "
  finale: .asciiz "Hasta la proxima!"
  linea: .asciiz "\n"

.text
.globl main
main:
  li $v0, 4
  la $a0, parar
  syscall
  li $t0, 0
  move $t2, $zero
loop:
  li $v0, 4
  la $a0, texto
  addi $t2, $t2, 1
  syscall
  li $v0, 5
  syscall
  beq $v0, $zero, exit
  add $t0, $t0, $v0
  j loop
exit:
  li $v0, 4
  la $a0, resultado
  syscall
  li $v0, 1
  move $a0, $t0
  syscall
  li $v0, 4
  la $a0, linea
  syscall
  li $v0, 4
  la $a0, promedio
  syscall
  div $t2, $t0, $t2
  move $a0, $t2
  li $v0, 1
  syscall
  li $v0, 4
  la $a0, linea
  syscall
  li $v0, 4
  la $a0, reset
  syscall
  li $v0, 5
  syscall
  move $t1, $v0
  bne $t1, $zero, main
  li $v0, 4
  la $a0, finale
  syscall
  li $v0, 10
  syscall
