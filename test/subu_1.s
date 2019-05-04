.data
.text
.globl main
main:
    # Start Test
	
	li $11, 0x80000002
	
	li $10, 0x7fffffff
	
    subu $7, $11, $10 #edge case: negative number overflow occurs but should not be expressed 

    # End Test

    # Exit program
    li $v0, 10
    syscall
