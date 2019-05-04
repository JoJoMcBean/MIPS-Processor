.data
.text
.globl main

main:

	ori $t0, $zero, 5
	add $t0, $t0, $t0 # positive + positive
	
	ori $t1, $zero, -6
	add $t1, $t1, $t1 # negative + negative
	
	add $t2, $t1, $t0 

	li $v0, 10
	syscall
