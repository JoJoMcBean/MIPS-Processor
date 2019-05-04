.data
.text
.globl main
main:
    # Start Test
    addi $4, $0, 0xFFFFFFFF     # $a0 <- 0xFFFFFFFF  maximum value
    addi $5, $0, 0x00000000	# $a1 <- 0x00000000  minimum value 
    or	 $6, $4, $5		# $a2 <- 0xFFFFFFFF  should be all F's
    				# this test's the "or" instructions ability to handle the extreme values which are the max and the min
    				# this has value because the 0xFFFFFFFF and 0x00000000 are very commonly used
    # End Test

    # Exit program
    li $v0, 10
    syscall
