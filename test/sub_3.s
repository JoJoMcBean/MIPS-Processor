.data
.text
.globl main
main:

    # Start Test
    
addi $t0, $0, -4
addi $t1, $0, -5
sub $t2, $t0, $t1 
    
    # Exit program
    
li $v0, 10
syscall
