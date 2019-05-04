.data
.text
.globl main
main:
    # Start Test of nor
    # This edge case is ensuring proper functionality of nor in the case of a 0 and 1 being nor'ed together
    # it uses minimal other instructions, allowing ease of testing
     
    ori $t1, $zero 0xFFFF     # t1 gets 0x0000FFFF
    
    andi $t2, 0x0000	# t2 gets 0x00000000
     
     nor $t3, $t2, $t1 #t3 gets t1 nor t2, should be 0xFFFF0000
    # End Test

    # Exit program
    li $v0, 10
    syscall
