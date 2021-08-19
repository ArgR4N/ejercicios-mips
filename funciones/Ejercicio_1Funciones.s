.data
prompt: .asciiz "Ingrese un año: "
esBisiesto: .asciiz "El año es bisiesto"
noEsBisiesto: .asciiz "El año no es bisiesto"

.text
.globl main
main:
    li $v0, 4
    la $a0, prompt
    syscall
    li $v0, 5
    syscall
    move $a0, $v0
    jal bisiestoFun
    beq $v0, $zero, noEs
es:
    li $v0, 4
    la $a0, esBisiesto
    syscall
    j exit
    
noEs:
    li $v0, 4
    la $a0, noEsBisiesto
    syscall
    j exit

bisiestoFun:
    rem $t0, $a0, 4
    bne $t0, $zero, false #Si no es divisible por 4 no es bisiesto
    rem $t0, $a0, 100
    bne $t0, $zero, true #Si es divisible por 4 y no por 100 es bisiesto
    rem $t0, $a0, 400
    bne $t0, $zero, false #Si es divisible por 4, no por 100 pero si por 400 es bisiesto
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