.data
    text: .asciiz "Suma de todos los numeros de 1 a 100: "
.text
.globl main
main:
    li $v0, 4
    la $a0, text
    syscall
    move $t0, $zero
    move $a0, $zero
loop:
    add $a0, $t0, $a0
    addi $t0, $t0, 1
    bgt $t0, 100, exit
    j loop
exit:
    li $v0, 1
    syscall
    li $v0, 10
    syscall
    