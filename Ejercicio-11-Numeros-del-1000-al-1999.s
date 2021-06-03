.data
    newLineText: .asciiz "\n"
    space: .asciiz " "
.text
.globl main
main:  
    li $a1, 1000
    li $a2, 0
loop:
    move $a0, $a1
    li $v0, 1
    syscall
    li $v0, 4
    la $a0, space
    syscall
    addi $a3, $a3, 1
    addi $a2, $a2, 1
    addi $a1, $a1, 1
    bgt $a1, 1999, exit
    bge $a2, 5, newLine
    j loop
newLine:
    li $a2, 0
    li $v0, 4
    la $a0, newLineText
    syscall
    j loop

exit:
    li $v0, 10
    syscall