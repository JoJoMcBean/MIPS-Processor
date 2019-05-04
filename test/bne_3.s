.data
.text
.globl main
main:
    # Start Test of testing a few different branches 
    addi $1, $0, 1  #Make $1 not equal to 0
    bne $0, $1, SUC1 #Go to SUC1 if it worked
    addi $20, $0, 10 #Have an instruction so that if it fails, the testing bench knows
    
SUC1:
    addi $19, $1, 19 #Make $19 not equal to $1
    bne $1, $19, SUC2 #Go to SUC2 on success
    addi $20, $0, 10 #Have an instruction so that if it fails, the testing bench knows
    
SUC2:
    addi $16, $1, 16 #Make $19 not equal to $1
    bne $19, $16, SUC3 #Go to SUC3 on success
    addi $20, $0, 10 #Have an instruction so that if it fails, the testing bench knows
    
SUC3:
    addi $14, $1, 14 #Make $19 not equal to $1
    bne $16, $14, SUC4 #Go to SUC4 on success
    addi $20, $0, 10 #Have an instruction so that if it fails, the testing bench knows
      
SUC4:
    addi $13, $1, 13 #Make $19 not equal to $1
    bne $14, $13, SUC5 #Go to SUC5 on success
    addi $20, $0, 10 #Have an instruction so that if it fails, the testing bench knows

SUC5:
    addi $11, $1, 255 #Make $19 not equal to $1
    bne $13, $11, SUC6 #Go to SUC6 on success
    addi $20, $0, 10 #Have an instruction so that if it fails, the testing bench knows
        
SUC6:
    addi $9, $1, 9 #Make $19 not equal to $1
    bne $1, $9, SUC7 #Go to SUC7 on success
    addi $20, $0, 10 #Have an instruction so that if it fails, the testing bench knows
        
SUC7:
    addi $8, $1, 10 #Make $19 not equal to $1
    bne $1, $8, SUC8 #Go to SUC8 on success
    addi $20, $0, 10 #Have an instruction so that if it fails, the testing bench knows
        
SUC8:
    addi $6, $1, 3 #Make $19 not equal to $1
    bne $1, $6, SUC9 #Go to SUC9 on success
    addi $20, $0, 10 #Have an instruction so that if it fails, the testing bench knows
        
SUC9:    
    # End Test
    # Exit program
    add $v1, $0, $0 #Add a value to $v1 on fail
    li $v0, 10
    syscall
