.data
.text
.globl main
main:
    # Start Test
    addi $4, $0, 0xF0F0F0F0     # $a0 <- 0xF0F0F0F0  alternating values
    addi $5, $0, 0x0F0F0F0F	# $a1 <- 0x0F0F0F0F  opposite alternating values
    or	 $6, $4, $5		# $a2 <- 0xFFFFFFFF  should be all F's
    				# this test's the "or" instructions ability to handle when there are no bits that are the same
    				# in each registers. This has value because we can check if "or" does not work for a specific bit.
    # End Test

    # Exit program
    li $v0, 10
    syscall
