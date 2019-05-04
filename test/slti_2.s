.data
.text
.globl main
main:
    # Start Test
	
	#Set registers for testing
	
	addi $5, $0, -8		#Testing for negative values
	slti $6, $5, -7		#-8 < -7, basic true example 
	slti $7, $5, -9		#-8 < -9, basic false example
	slti $8, $5, -8		#-8 < 8, check to see if equality is false
	
    # End Test
    # Exit program
    li $v0, 10
    syscall
