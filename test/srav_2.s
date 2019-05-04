.data
.text
.globl main
main:	
	li $1, 1000
	srav $3, $1, $0 #Test to see if it doesn't shift

	li $v0, 10
    syscall
