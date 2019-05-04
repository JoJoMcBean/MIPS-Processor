.data
.text
.globl main
main:
    # Start Test
addi $t0, $0, 909090
addi $t1, $0, 000000
xor $t1, $t0, $t1

    # End Test

    # Exit program
    li $v0, 10
    syscall
