.data
	myVar: .word 123
.text
.globl main
main:
	la $s0, myVar 
	
	li $s1 0x1234
	li $s2 0x5678
	li $s3 0x4444
	li $s4 0x7777
	

	sw $s1, 0($s0)	#verify that one can store word without offset
	sw $s2, 0($s0)	#verify that one can store word without offset
	sw $s3, 0($s0)	#verify that one can store word without offset
	sw $s4, 0($s0)	#verify that one can store word without offset
	
    # Exit program
    li $v0, 10
    syscall
