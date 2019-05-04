.data
.text
.globl main
main:
    # Start Test

	#positive, nagative, 0 cross check
    addi $1, $0, 2       # store 1 to $1
	sltiu $6, $1, -3  # returns 0 because 65533 is read as -3 instead of positive 65533, hence 2 is bigger than -3
	addi $1, $0, -2   # store -2 to $1
	sltiu $2, $1, 0      # returns 1 because 65534 is read as -2 instead of positive 65534, hence -2 is less than 0 
	sltiu $3, $1, -1  # returns 1 because 65535 is read as -1 instead of positive 65535, hence -2 is less than -1
	sltiu $4, $1, -2  # returns 1 because 65534 is read as -2 instead of positive 65534, hence -2 is equals to -2
	sltiu $5, $1, -3  # returns 0 because 65533 is read as -3 instead of positive 65533, hence -2 is bigger than -3 
	sltiu $6, $1, 2      # returns 1 because 65534 is read as -2 instead of positive 65534, hence -2 is less than 2
	add $1, $0, $0       # store 0 to $1
    sltiu $2, $1, -1  # returns 1 because 65535 is read as -1 instead of positive 65535, hence 0 is bigger than -1 

	# End Test

    # Exit program
    li $v0, 10
    syscall
