.data
.text
.globl main
main:
    # Start
    addi $1, $0, -1
    lui $1, 0x00FF		# loads 0x00FFFFFF into reg 1
    addiu $2, $1, 0x0200	# checks what the output will be when there would not be overflow in signed addition
    
    # End Test

    # Exit program
    li $v0, 10
    syscall
