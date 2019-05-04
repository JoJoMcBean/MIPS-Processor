.data
.text
.globl main
main:
    # Start
    addi $2, $0, -1
    lui $2, 0x7FFF		# loads 0x7FFFFFFF into reg 1
    addiu $3, $2, -1	# shows that immediate gets sign extended and subtracts 1 from $1
    
    # End Test

    # Exit program
    li $v0, 10
    syscall
