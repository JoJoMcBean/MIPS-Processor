.data
.text
.globl main
main:
    # Start Test(
    #This is checking to make sure the sltu still works even at the maximum number a register can hold (edge cases)
    #since slt uses subtraction this tests the edge case of two large negative number being added
    addi $t0, $zero, -2147483648
    addi $t1, $zero, 2147483647
    sltu $t2, $t0, $t1 #check that this is a 0 since negatives will always be larger in unsigned comparison
    #Test the edge case of large positives being added together
    addi $t0, $zero, 2147483647
    addi $t1, $zero, -2147483648
    sltu $t2, $t0, $t1 #check that this is a 1 since negatives will always be larger in unsigned comparison
    # End Test

    # Exit program
    li $v0, 10
    syscall