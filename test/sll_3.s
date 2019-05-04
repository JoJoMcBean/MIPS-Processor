.data
.text
.globl main
main:
	#Start Test MID SHIFT AMOUNT
	addi $s0, $0, 1
	
	sll $2, $s0, 16	#Testing a shift of 16: result should be 0x00010000
	# End Test

    # Exit program
    li $v0, 10
    syscall
