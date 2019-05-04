.data
.text
.globl main
main:
    # Start Test
    
    #fill the registers with -2, 4, 8
    addi $t0, $zero, -2
    addi $t1, $zero, 4
    addi $t2, $zero, 8
    
    sllv $t3, $t1, $t0  #should not change, trying to shift left by a negative value
    sllv $t4, $t1, $t2  #should change to 0x400
    

    # End Test

    # Exit program
    li $v0, 10
    syscall
