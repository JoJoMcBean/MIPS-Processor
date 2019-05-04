.data
.text
.globl main
main:
# this tests what happens if altering the $ra after a jal instruction is possible.
# the result was that it changes which means we should be careful and save the $ra contents after a call to jal just to be safe 


# Start Test
addi $t0, $0, 0     # holds a memory address at t0
        
jal go
addi $t1, $0, 2
go: 
addi $ra, $ra, 4
		
    # End Test
    # Exit program
    li $v0, 10
    syscall
