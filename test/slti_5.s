.data
.text
.globl main
main:

    li $t0, 0x80000000
    slti $t1, $t0, 1

    # Exit program
    li $v0, 10
    syscall
