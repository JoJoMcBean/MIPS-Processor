.data
.text
.globl main
main:
    # Start Test
	addi $1, $0, 0 # reg 1 = x00000000
	addi $2, $0, 0 # reg 2 = x00000000
	
	lui $1, 2      # reg 1 = x00020000
	lui $2, 1      # reg 2 = x00010000
	
    subu $3, $1, $2 #common case: pos - pos = pos

    # End Test

    # Exit program
    li $v0, 10
    syscall
