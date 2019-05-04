.data
.text
.globl main
main:
# Attempt to add an immediate to register 0.
	addi $0, $0, 100
	addi $0, $0, -1000
	
	#Register 0 should remain 0 no matter what. 
	#Ensure register file is set up properly to accomodate this
	#Can lead to issues later if this is not the case.
# End Test

    # Exit program
    li $v0, 10
    syscall
