.data
	.word 0
	myVar: .word 123
.text
.globl main
main:
	la $s0, myVar 
	
	li $s1 0x1234
	li $s2 0x5678
	li $s3 0x4444
	li $s4 0x7777
	

	sw $s1, -4($s0)	#verify that one can store word with - offset
	sw $s2, -4($s0)	#verify that one can store word with - offset
	sw $s3, -4($s0)	#verify that one can store word with - offset
	sw $s4, -4($s0)	#verify that one can store word with - offset
	
    # Exit program
    li $v0, 10
    syscall
