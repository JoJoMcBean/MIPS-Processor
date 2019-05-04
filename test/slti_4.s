.data
.text
.globl main
main:
    # Start Test
	addi $1, $0, 600					#	initialize register 1
    slti $2, $1, 601					#	test slti result 1 and register 2
    slti $2, $1, 600					#	test slti equal values and register 2
    slti $2, $1, 599					#	test slti result 0 and register 2
	slti $2, $1, 4294967295				#	test first bit 0 < 1
	addi $1, $0, 4294967294				#	set register to be compared to
	slti $2, $1, 4294967295				#	compare two msb 1 numbers 1 < 1
	slti $2, $1, 12						#	compare 1 < 0
    # End Test

    # Exit program
    li $v0, 10
    syscall
