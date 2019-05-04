.data
.text
.globl main
main:
    # let's initialize just because
    li $s0, 0x1234

    # Start Test For bne failing on same register compare
    bne $s0, $zero, fail		#verify that running bne on the same registers does not fail
 
   li $s0 0 #avoid me
   li $s0 1
    # End Test
fail:
    # Exit program
    li $v0, 10
    syscall
