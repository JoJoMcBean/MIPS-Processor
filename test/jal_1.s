.data
.text
.globl main
main:
# this tests what happens if jal instruction keeps calling it self without branshing statements above it
# the result was that it got stuck on an infinte loop
    # Start Test
    jal go   
    addi $t0, $0, 0     # holds a memory address at t0
    addi $t1, $0, 2
    addi $t1, $t1, 2
go:
addi $t1, $0, 2

		
    # End Test

    # Exit program
    li $v0, 10
    syscall
