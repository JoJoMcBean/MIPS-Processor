.data
.text
.globl main
main:
    # Start Test
    
    #fill the registers with 1, 2, 5
    addi $t0, $zero, 1 
    addi $t1, $zero, 2
    addi $t2, $zero, 5
    addi $t7, $zero, 20
    
    sllv $t3, $t1, $t1 #shifting 0x2, 2 times, which results in 0x8
    sllv $t4, $t3, $t2 #shifting 0x8, 5 times, which results in 0x100
    sllv $t5, $t3, $t0 #shifting 0x100, 1 time, which results in 0x10
    sllv $t6, $t5, $t2 #shifting 0x10 by 5, which results in 0x200
    sllv $s0, $t0, $t7 #shiftting 0x1 by 20, which results in 0x100000
    sllv $s1, $t7, $t2 #shifting 0x14 by 5, which should result in 0x280
 
    # End Test

    # Exit program
    li $v0, 10
    syscall
