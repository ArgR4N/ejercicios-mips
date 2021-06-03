.data
    prompt: .asciiz "Ingrese un numero para multiplicar: "
    msg: .asciiz "El resultado es: "
    line: .asciiz "\n"
.text
.globl main
main:
    li $v0, 4
    la $a0, prompt
    syscall
    li $v0, 5
    syscall
    move $a2, $v0
    li $v0, 4
    la $a0, prompt
    syscall
    li $v0, 5
    syscall
    move $a1, $v0
    jal multiplicar
    move $t0, $v0
    li $v0, 4
    la $a0 ,msg
    syscall
    li $v0, 1
    move $a0, $t0
    syscall
    li $v0, 4
    la $a0, line
    syscall
    li $v0, 10
    syscall
multiplicar:
    mul $v0, $a2, $a1
    jr $ra