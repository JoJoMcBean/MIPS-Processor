.data
.text
.globl main
main:
    # Start Test
	
	#Set registers for testing
	
    	addi $1, $0, 8		#Register for holding test value
	slti $2, $1, 9		#8 < 9, basic true example 
	slti $3, $1, 7		#8 < 7, basic false example
	slti $4, $1, 8		#8 < 8, check to see if equality is false
	
    # End Test
    # Exit program
    li $v0, 10
    syscall
