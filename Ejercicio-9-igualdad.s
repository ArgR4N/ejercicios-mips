.data
    text: .asciiz "Ingrese un numero positivo para ver si es divisible por el siguiente: "
    text2: .asciiz "Ingrese un numero positivo para dividir el anterior: "
    True: .asciiz "Los numeros son divisibles\n"
    false: .asciiz "Los numeros no son divisibles\n"
    errorText: .asciiz "Un numeros no es positivo\n"

.text
.globl main
main:
    li $v0, 4
    la $a0, text
    syscall
    li $v0, 5
    syscall
    move $t0, $v0
    li $v0, 4
    la $a0, text
    syscall
    li $v0, 5
    syscall
    move $t1, $v0
    bgt $t1, $zero, verificarDivisible1
    li $v0, 4
    la $a0, errorText
    syscall
    j exit
verificarDivisible1:
    bgt $t0, $zero, verificarDivisible
    li $v0, 4
    la $a0, errorText
    syscall
    j exit 
verificarDivisible:
    div $t2, $t1, $t0
    mul $t3, $t2, $t0
    bne $t2, $t3, False
    li $v0, 4
    la $a0, True
    syscall
    j exit
False:
    li $v0, 4
    la $a0, false
    syscall
    j exit
exit:
    li $v0, 10
    syscall
