.data
.text
.globl main
main:
    # Start Test
    #this is checking that slt is using usigned and not signed comparator
    addi $t0, $zero, -7
    addi $t1, $zero, 5
    sltu $t2, $t0, $t1 #check that this is a 0 since -7 unsigned is greater than 5
    #check other way to test method works both ways
    addi $t0, $zero, 5
    addi $t1, $zero, -7
    sltu $t2, $t0, $t1 #check that this is a 1 since 5 unsigned is less than -7 unsigned
    # End Test

    # Exit program
    li $v0, 10
    syscall
