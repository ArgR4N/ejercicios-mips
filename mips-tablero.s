.data
    msg: .asciiz"Ingrese un numero para definir la cantidad de columnas y filas de un tablero: "
    x: .asciiz"  X  "
    o: .asciiz"  O  "
    spaceLine: .asciiz"  "
    nl: .asciiz"\n"

.text
.globl main
main:
    li $v0, 4
    li $t1, 1
    la $a0, msg
    syscall
    li $v0, 5
    syscall
    move $t0, $v0
    move $t2, $t0 #copia de n para las filas
    move $t3, $t0 #copia de n tipo constante
loopLine:
    beq $t2, $zero, exit 
    beq $t0, $zero, newLine
    jal marcas
    addi $t0, $t0, -1
    j loopLine

marcas:
    beq $t1, $zero, equis
    li $t1, 0
    li $v0, 4
    la $a0, o
    syscall
    jr $ra
equis:
    li $t1, 1
    li $v0, 4
    la $a0, x
    syscall
    addi $t0, $t0, -1
    j loopLine
newLine:
    jal invertirt1
    li $v0, 4
    la $a0, nl
    syscall
    li $v0, 4
    la $a0, nl
    move $t0, $t3
    addi $t2, $t2, -1
    syscall
    j loopLine

invertirt1:
    rem $t6, $t3, 2
    beq $t6, $zero, hacer
    jr $ra
hacer:
    beq $t1, $zero, t10
    bne $t1, $zero, t11
t10:
    li $t1, 1
    jr $ra
t11:
    li $t1, 0
    jr $ra

exit:
    li $v0, 10
    syscall
