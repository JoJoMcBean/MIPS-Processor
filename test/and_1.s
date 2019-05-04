.data
.text
.globl main
main:
    # Check that anding all ones with all ones returns all ones. This is an edge case
    # Start Test
    addi $1, $0, 0xFFFFFFFF     # Set $1 to max value  
    addi $2, $0, 0xFFFFFFFF     # Set $2 to max value

    and $3, $2, $1              # Test that a register with all 1's anded with all 1's is all 1's.
    # End Test

    # Exit program
    li $v0, 10
    syscall