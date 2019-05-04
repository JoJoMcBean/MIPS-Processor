.data
.text
.globl main
main:
    # Start Test of nor
    #This test ensures the proper functionality of nor when given 1 and 1
    lui $t1, 0xFFFF     
    ori $t1, 0xFFFF     # t1 gets 0xFFFFFFFF
    
    lui $t2, 0xFFFF
    ori $t2, 0xFFFF	# t2 gets 0xFFFFFFFF
     
     nor $t3, $t2, $t1 #t3 gets t1 nor t2, should be 0x00000000
    # End Test

    # Exit program
    li $v0, 10
    syscall
