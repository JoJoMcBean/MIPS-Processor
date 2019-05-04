.data
.text
.globl main
main:
	
    li $t0, 0xffffffff
    # set all the bits to 0 incrementally
    andi $t0, 0x8888
    andi $t0, 0x1111
    andi $t0, 0x2222
    andi $t0, 0x4444

    # Exit program
    li $v0, 10
    syscall
