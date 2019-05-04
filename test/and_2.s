.data
.text
.globl main
main:
    # Check that anding patterns of ones and zeros that don't line up. They should cancel out. This is a normal use case test.
    # Start Test
    li $2, 0xAAAAAAAA     # Set $1 to alternating 1's with largest bit a 1 
    li $3, 0x55555555     # Set $2 to alternating 1's with largest bit a 0

    and $4, $3, $2              # Result should be 0
    # End Test

    # Exit program
    li $v0, 10
    syscall
