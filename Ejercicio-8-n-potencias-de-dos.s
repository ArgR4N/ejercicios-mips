.data  
    prompt: .asciiz "Ingrese la cantidad de potencias que quiere de 2: "
    line: .asciiz "\n"
    arregloText: .asciiz "La cantidad de potencias tiene como valor maximo 30"
.text
.globl main
main:
    li $v0, 4
    la $a0, arregloText
    syscall
    li $v0, 4
    la $a0, prompt
    syscall
    li $v0, 5
    syscall
    move $t0, $v0
    move $t1, $zero
    addi $t1, $t1, 2 
    bgt $t0, 30, arreglo
arreglo:
    add $t3, $t3, 30
    move $t0, $t3
    li $v0, 4
    la $a0, arregloText
    syscall
    j loop
loop:
    beq $t0, $zero, exit
    li $v0, 1
    move $a0, $t1
    syscall
    li $v0, 4
    la $a0, line
    syscall
    mul $t1, $t1, 2
    addi $t0, $t0, -1
    j loop
exit:
    li $v0, 10
    syscall