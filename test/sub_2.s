.data
.text
.globl main
main:

    # Start Test
    
sub $t0, $0, $0		# clear register $t0 and set to 0
sub $t1, $0, $0		# clear register $t1 and set to 0
sub $t2, $0, $0		# clear register $t2 and set to 0
sub $t3, $0, $0		# clear register $t3 and set to 0
sub $t4, $0, $0		# clear register $t4 and set to 0
sub $t5, $0, $0		# clear register $t5 and set to 0
sub $t6, $0, $0		# clear register $t6 and set to 0
sub $t7, $0, $0		# clear register $t7 and set to 0
    
    # Exit program
    
li $v0, 10
syscall