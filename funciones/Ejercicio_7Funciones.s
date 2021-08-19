.data
input: .asciiz "Ingrese la cantidad de numeros naturales que quiere sumar: "

.text
.globl main
main:
    li $v0, 4
    la $a0, input
    syscall #Print Input
    li $v0, 5
    syscall #Input
    move $a0, $v0 #a0 = v0
    jal naturalesFunc #naturalesFunc(n)
    move $a0, $v0 #Pasa el valor devuetlo para poder imprimirlo
    li $v0, 1
    syscall
    j exit
naturalesFunc:
    

exit:
    li $v0, 10
    syscall #Exit