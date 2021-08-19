.data
prompt: .asciiz "Ingrese un numero: "
esPar: .asciiz "El año es par"
esImpar: .asciiz "El año es impar"

.text
.globl main
main:
    li $v0, 4
    la $a0, prompt
    syscall
    li $v0, 5
    syscall
    move $a0, $v0
    jal parFunc
    bne $v0, $zero, printEs

printEsNoEs:
    li $v0, 4
    la $a0, esImpar
    syscall
    j exit

printEs:
    li $v0, 4
    la $a0, esPar
    syscall
    j exit

parFunc:
    rem $s0, $a0, 2
    bne $s0, $zero, false
true:
    li $v0, 1
    j return

false:
    li $v0, 0

return:
    jr $ra

exit:
    li $v0, 10
    syscall