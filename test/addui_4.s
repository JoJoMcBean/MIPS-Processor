.data
.text
.globl main
main:
    # Start Test
	# tests adding a series of positive and negative values
    addiu $1, $0, 0     # start with an initial value of 0 in register 1 
	addiu $2, $1, 1		# adds a seres of ascending values to registers 1-5 referencing the previous register
	addiu $3, $2, 2		# adds a seres of ascending values to registers 1-5 referencing the previous register
	addiu $4, $3, 3		# adds a seres of ascending values to registers 1-5 referencing the previous register
	addiu $5, $4, 4		# adds a seres of ascending values to registers 1-5 referencing the previous register
	addiu $6, $5, 0		# sets $6 to 0 to check resetting values
	addiu $4, $6, 5		# checks overwriting registers previusly set and the addition of negative immediates
	addiu $4, $4, -10	# checks overwriting registers previusly set and the addition of negative immediates
	addiu $3, $4, 5		# checks overwriting registers previusly set and the addition of negative immediates
	addiu $2, $3, -1337	# checks overwriting registers previusly set and the addition of negative immediates
	addiu $1, $2, -943	# checks overwriting registers previusly set and the addition of negative immediates
	addiu $1, $1, 7777	# checks overwriting registers previusly set and the addition of negative immediates
	
    # End Test

    # Exit program
    li $v0, 10
    syscall
