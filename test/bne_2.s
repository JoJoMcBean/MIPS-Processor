.data
.text
.globl main
main:
    # Start Test for failing on different registers with same values
    add $1, $0, $0		#set the value in R1 to 0
    bne $0, $1, fail 		#verify that running bne on the registers with the same value does not fail

    add $2, $0, $1		#set the value in R2 to R1
    bne $1, $2, fail		#verify that running bne on the registers with the same value does not fail

    add $5, $0, $2		#set the value in R5 to R2
    bne $2, $5, fail		#verify that running bne on the registers with the same value does not fail

    add $8, $0, $5		#set the value in R8 to R5
    bne $5, $8, fail		#verify that running bne on the registers with the same value does not fail

    add $13, $0, $8		#set the value in R13 to R8
    bne $8, $13, fail		#verify that running bne on the registers with the same value does not fail

    add $20, $0, $13		#set the value in R20 to R13
    bne $13, $20, fail	#verify that running bne on the registers with the same value does not fail

    add $25, $0, $20		#set the value in R25 to R20
    bne $20, $25, fail	#verify that running bne on the registers with the same value does not fail

    add $27, $0, $25		#set the value in R27 to R25
    bne $25, $27, fail	#verify that running bne on the registers with the same value does not fail  

    add $30, $0, $27		#set the value in R30 to R27
    bne $27, $30, fail	#verify that running bne on the registers with the same value does not fail
    
fail:
    # End Test

    # Exit program
    li $v0, 10
    syscall
