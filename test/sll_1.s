.data
.text
.globl main
main:
    # Start Test
    lui $6, 0xade8   
    ori $6, 0x8000       # Given the binary for an instruction: 10101101111010001000000000000000
    sll $6, $6,7        #  varify that shift $6 7bits to the left : 11110000000000000000000000000000 works in the ALU
    
     # End Test

    # Exit program
    li $v0, 10
    syscall
    