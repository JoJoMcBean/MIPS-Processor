.data
.text
.globl main
main:
	#Start Test MIN SHIFT AMMOUNT
	addi $s0, $0, 1
	
	sll $2, $s0, 0	#Testing a shift of 0: NOOP
	# End Test

    # Exit program
    li $v0, 10
    syscall