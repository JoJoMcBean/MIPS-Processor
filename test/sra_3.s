.data
.text
.globl main
main:
    #start test
    addi $1, $0, 0x88888888   #tests register 1, sets it for 0x11111111 for sra
    sra $2,$1, 1    #tests a shift of 1 in regsiter 1, this allows to clearly see a arithmetic shift right
    sll $3, $2,1    #tests to make sure value of regsiter 2 works, and resets it back to register 1
    sra $4,$3, 5    #tests to make sure value of regsiter 3 works, and shifts by 5
    sra $5,$4, 3    #tests to make sure value of regsiter 4 works, and shifts by 3
    sll $6,$5, 4    #tests to make sure that register 5 can be used for another instruction
    sra $7, $6, 20  #tests the right shift of 20, this will be used to test for that the value of register 7 has kept some of the original but shifted multiple times to see if the data is shifted properly
    #end test
    # Exit program
    li $v0, 10
    syscall
