.data
.text
.globl main
main:
    # Start Test of nor
    #This test is ensuring that nor functions correctly when each given 0 and 0
    lui $t1, 0x0000     
    andi $t1, 0x0000    # t1 gets 0x00000000
    
    lui $t2, 0x0000
    andi $t2, 0x0000	# t2 gets 0x00000000
     
     nor $t3, $t2, $t1 #t3 gets t1 nor t2, should be 0xFFFFFFFF
    # End Test

    # Exit program
    li $v0, 10
    syscall
