.data
.text
.globl main

main:
    # Start Test
    addi $0, $0, 0
    j pos1 		# verify that jump works for positive value
neg1:
    addi $0, $0, 0
    addi $0, $0, 0
    j exit		# also veifies jump for positive value
pos1:
    addi $0, $0, 0
    addi $0, $0, 0
    addi $0, $0, 0
    j neg1 		# verify that jump works for negative value
exit:
    # End Test

    # Exit program
    li $v0, 10
    syscall
