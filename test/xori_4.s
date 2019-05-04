.data
.text
.globl main
main:
    #Test XORI
    #xor register $t1 (containing value 0x1111) with immediate value of 0x1111
    #Result should be 0x0000

    addi $t0, $zero, 0xF00F      # $t0 = 0xF00F
    xori $t0, $t0, 0x0FF0        #result should be 0xFFFF

    addi $t1, $zero, 0x0000      # $t1 = 0
    xori $t1, $t1, 0x0000        # result should be 0x0000

    addi $t2, $zero, 0xFBCD      # $t2 = 0xFBCD
    xori $t2, $t2, 0x0010        # result should be 0xFBDD

    # Exit program
    li $v0, 10
    syscall
