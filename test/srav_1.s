.data
.text
.globl main
main:

	li $1, 1000
	li $2, 0001
	srav $3, $1, $2 #Test to see if it shifts by the shift amount
	andi $s0, $3, 0100
	
    li $v0, 10
    syscall
