.data
.text
.globl main
main:
	# Start Test
	addi $1, $0, 8 # loads 8 into register 1
	addi $2, $0, 12 # loads 12 into register 2
	addi $3, $0, 32767 # loads 5 into register 3
	andi $4, $0, 1 # register 4 should be 0 (0 AND 12 for an edge case)
	andi $5, $3, 32767 # register 5 should be 32767 (32767 AND 32767) 
	andi $6, $3, 3 # register 6 should be 3 (32767 AND 3)
	
    # Exit program
    li $v0, 10
    syscall