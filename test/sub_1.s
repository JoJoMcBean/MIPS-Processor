.data
.text
.globl main
main:

    # Start Test
addi $t0, $0, 5		# add 5 to $t0
addi $t1, $0, 3		# add 3 to $t1
sub $t2, $t0, $t1	# 5 – 3 = 2 
sub $t3, $t0, $t0	# 5 - 5 = 0
sub $t4, $t2, $t2	# 2 - 2 = 0

# Exit program
li $v0, 10
syscall