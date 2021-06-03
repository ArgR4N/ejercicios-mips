.data
promptPrimero: .asciiz "Ingrese el primer numero: "
promptSegundo: .asciiz "Ingrese el segundo numero: "
promptTercero: .asciiz "Ingrese el tercer numero: "
errorTexto: .asciiz "El numero ingresado debe ser positivo y entero."
trueText: .asciiz "Los numeros son iguales"
falseText: .asciiz "Los numeros no son iguales"
.text
.globl main
main:
    li $v0, 4
    la $a0, promptPrimero
    syscall
    li $v0, 5
    syscall
    move $t0, $v0
    li $v0, 4
    la $a0, promptSegundo
    syscall
    li $v0, 5
    syscall
    move $t1, $v0
    li $v0, 4
    la $a0, promptTercero
    syscall
    li $v0, 5
    syscall
    move $t2, $v0
    beq $t0, $t1, loopNext
    j false
loopNext:
    beq $t0, $t2, true
false:
    li $v0, 4
    la $a0, falseText
    syscall
    j exit
true:
    li $v0, 4
    la $a0, trueText
    syscall
    j exit
exit:
    li $v0, 10
    syscall

