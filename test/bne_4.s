.data
.text
.globl main
main:
    # let's initialize just because
    li $s0, 0x1234

    bne $s0, $zero, good0
 
    li $s0 0 #avoid me
good1:
     # Exit program
    li $v0, 10
    syscall
    
        li $s0 0 #avoid me
    li $s0 1
good0:
   bne $s0, $zero, good1

    # Exit program
    li $v0, 10
    syscall
