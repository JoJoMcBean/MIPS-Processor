.data
.text
.globl main
main:
    # Start Test
	li $8, 0x80000000
	
	addi $9, $0, 0 # reg 9 = x00000000
	
    subu $7, $9, $8 #edge case: positive number overflow occurs but should not be expressed 

    # End Test

    # Exit program
    li $v0, 10
    syscall
