.data
.text
.globl main
main:
    # Start
    li $2, 0x7FFFFFFF # loads 0x7FFFFFFF into reg 1
    addiu $3, $2, 0x0001	# immediate gets sign extended to 0xFFFFF000, would cause overflow in signed addition
    
    # End Test

    # Exit program
    li $v0, 10
    syscall
