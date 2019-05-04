.data
.text
.globl main
main:
    # Start Test 0: tests positive and negative signed numbers 
    
    addi $1, $0, 1      # signed value 1 in R1   
    addi $2, $0, 2      # signed value 2 in R2        
    addi $11, $0, -1    # signed value -1 in R11    
    addi $12, $0, -2    # signed value -2 in R12                 
 
    sltu  $25, $1, $2     # signed 1 < signed 2 should be 1 
    sltu  $26, $2, $1     # signed 3 < signed 2 should be 0 
    sltu  $27, $12, $1    # signed -2 < signed 1 should be 0 because it treats -4 as an unsigned value
    sltu  $28, $1, $12    # signed 1 < signed -2 should be 1 becasue it treats -4 as an unsigned value
    sltu  $29, $12, $11   # signed -2 < signed -1 should be 1 becasue both numbers are treated as unsigned values
    sltu  $30, $11, $12   # signed -1 < signed -2 should be 0 becasue both numbers are treated as unsigned values
    # End Test

    # Exit program
    li $v0, 10
    syscall
