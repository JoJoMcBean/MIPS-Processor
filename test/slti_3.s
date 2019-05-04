.data
.text
.globl main
main:
    # Start Test
	
	addi $9, $0, 0		#Testing for 0
	slti $10, $9, 8		#0 < 8, basic true example 
	slti $11, $9, -8	#0 < -8, basic false example
	slti $12, $9, -0	#0 < 0, check to see if equality is false
	
	
    # End Test
    # Exit program
    li $v0, 10
    syscall
