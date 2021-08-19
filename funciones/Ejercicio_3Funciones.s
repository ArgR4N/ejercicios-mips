.data
prompt: .asciiz "Ingrese un numero: "

.text
.globl main
main:
    li $v0, 4
    la $a0, prompt
    syscall
    li $v0, 5
    syscall
    move $a0, $v0
    jal absFunc
    move $a0, $v0
    li $v0, 1
    syscall
    j exit
absFunc:
    blt $a0, $zero, negativo
    move $v0, $a0
    jr $ra

negativo:
    mul $v0, $a0, -1
    jr $ra

exit:
    li $v0, 10
    syscall