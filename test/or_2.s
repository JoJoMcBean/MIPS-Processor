.data
.text
.globl main
main:
    # Start Test
    addi $4, $0, 0xF0F0F0F0     # $a0 <- 0xF0F0F0F0  alternating values
    addi $5, $0, 0x00000000	# $a1 <- 0x00000000  all 0's
    or	 $6, $4, $5		# $a2 <- 0xFFFFFFFF  should be the value in $a0
    				# this test's the "or" instructions ability to handle dealing with a register with all 0's.
    				# This has value because we can do bit preservation by or'ing with a register with all 0's.
    # End Test

    # Exit program
    li $v0, 10
    syscall
