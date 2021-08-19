.data
prompt: .asciiz "Ingrese numero:"
puede: .asciiz "Puede ser triangulo"
noPuede: .asciiz "No puede ser triangulo"

.text
.globl main
main:
    li $v0, 4
    la $a0, prompt
    syscall
    li $v0, 5
    syscall
    move $t0, $v0   # <-- primer argumento (a)
    li $v0, 4
    la $a0, prompt
    syscall
    li $v0, 5
    syscall
    move $t1, $v0   # <-- segundo argumento (b)
    li $v0, 4
    la $a0, prompt
    syscall
    li $v0, 5
    syscall
    move $t2, $v0   # <-- tercer argumento (c)
    move $a0, $t0
    move $a1, $t1
    move $a2, $t2
    jal isTriangle
    move $a0, $v0
    bne $a0, $zero, printEs
printNoEs:
    li $v0, 4
    la $a0, noPuede
    syscall
    j exit
printEs:
    li $v0, 4
    la $a0, puede
    syscall
    j exit
    

isTriangle: #isTriangle(a, b, c)
    add $t0, $a0, $a1 # t0 = a0 + a1
    add $t1, $a0, $a2 # t1 = a0 + a2
    add $t2, $a1, $a2 # t2 = a1+ a2
    bge $a0, $t1, false # a >= bc ?
    bge $a1, $t2, false # b >= ac ?
    bge $a2, $t0, false # c >= ab ?
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