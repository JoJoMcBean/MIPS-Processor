.data
.text
.globl main
main:
	#Start Test MAX SHIFT AMOUNT
	addi $s0, $0, 1
	
	sll $2, $s0, 31	#Testing a shift of 31: result should be 0x1
	# End Test

    # Exit program
    li $v0, 10
    syscall
