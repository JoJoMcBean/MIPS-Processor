.data
.text
.globl main
main:
    # Start Test
addi $t0, $0, 999999
addi $t1, $0, 999999
xor $t1, $t0, $t1

    # End Test

    # Exit program
    li $v0, 10
    syscall