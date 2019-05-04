.data
.text
.globl main
main:
    # Start Test
    
    #fill the registers with 31, 32, 1
    addi $t0, $zero, 31 
    addi $t1, $zero, 4845
    addi $t2, $zero, 1
    
    sllv $t3, $t2, $t0 #should result in 0x80000000
    sllv $t4, $t2, $t1 #should stay as 0x1
    
    # End Test

    # Exit program
    li $v0, 10
    syscall
