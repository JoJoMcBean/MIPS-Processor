.data
.text
.globl main
main:
    # Start Test for 'add'
    lui $1, 0x8000	# load upper 16 bits of register with 0x8000
    lui $2, 0x7FFF	# load upper 16 bits of register with 0x7FFF
    ori $2, 0xFFFF	# load lower 16 bits of resiter with 0xFFFF
    add $3, $1, $2	# add largest positive and largest negative equals -1
    # End Test

    # Exit program
    li $v0, 10
    syscall
