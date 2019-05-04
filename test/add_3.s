.data
.text
.globl main
main:
    # Start Test for 'add'
    addi $1, $zero, 0xFF	# load 0xFF into register
    addi $2, $zero, 0xFF00	# load 0xFF00 into register
    add $3, $1, $2		# add both = 0xFFFF
    # End Test

    # Exit program
    li $v0, 10
    syscall
