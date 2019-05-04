.data
.text
.globl main
main:
    # Start Test
    addi $1, $0, 1  	# Load the value 1 into register 1  
    addi $2, $0, -3   	# Load the value -3 into register 2
    
	slt  $3, $1, $2		# Set register $3 if $1 < $2. In this case, $3 is NOT set to 1, it has a value of 0.
	
    # End Test

    # Exit program
    li $v0, 10
    syscall
	
	# COMMENTS:
	# This test case covers when the first operand is greater than the second operand, and the second operand is a negative number. It is important to test this edge case, as this instruction is 
	# often used during loops and we would want the loop to stop at the correct iteration. We also want this instruction to be able to handle negative numbers correctly.
	# 
	
	# There are distinct three cases when using the slt instruction:
	# 	The operands are the same
	# 	The first operand is less than the second operand
	# 	The second operand is less than the first operand
	# Additionally, because this instruction works with signed numbers, each case can be tested once more with at least one of the operands as a negative value.