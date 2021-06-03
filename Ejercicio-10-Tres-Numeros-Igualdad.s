.data
promptPrimero: .asciiz "Ingrese el primer numero: "
promptSegundo: .asciiz "Ingrese el segundo numero: "
promptTercero: .asciiz "Ingrese el tercer numero: "
errorTexto: .asciiz "El numero ingresado debe ser positivo y entero."
trueText: .asciiz " es mayor o igual a la suma de los otros dos."
false: .asciiz "Ninguno de los numeros es mayor o igual a la suma de los otros dos."
.text
.globl main
main:
    li $v0, 4
    la $a0, promptPrimero
    syscall
    li $v0, 5
    syscall
    move $t0, $v0
    ble $t0, $zero, error
    li $v0, 4
    la $a0, promptSegundo
    syscall
    li $v0, 5
    syscall
    move $t1, $v0
    ble $t1, $zero, error
    li $v0, 4
    la $a0, promptTercero
    syscall
    li $v0, 5
    syscall
    move $t2, $v0
    ble $t2, $zero, error
    j loop
error:
    li $v0, 4
    la $a0, errorTexto
    syscall
    j main
loop:
    move $a0, $t2
    add $t3, $t0, $t1
    bge $t2, $t3, true 
    move $a0, $t1
    add $t4, $t0, $t2
    bge $t1, $t4, true 
    move $a0, $t0
    add $t5, $t2, $t1
    bge $t0, $t5, true 
    li $v0, 4
    la $a0, false
    syscall
    j exit
true:
    li $v0,1
    syscall
    li $v0, 4
    la $a0, trueText
    syscall
exit:
    li $v0, 10
    syscall

