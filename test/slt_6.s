.data
.text
.globl main
main:
	# I am trying to force arithmetic overflow here
	li $t0 0x80000000 # smallest integer
	li $t1 1
	li $t2 0x7fffffff # biggest integer
	
	# test all orders
	slt $t3, $t0, $t1
	slt $t3, $t0, $t2
	slt $t3, $t1, $t0
	slt $t3, $t1, $t2
	slt $t3, $t2, $t0
	slt $t3, $t2, $t1
	
	#test min. min

    li $v0, 10
    syscall
