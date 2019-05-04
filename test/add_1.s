.data
.text
.globl main

main:
	#Start test
	add $t0, $zero, $zero  # test 0 + 0
 
	# End Test

	# Exit program
	li $v0, 10
	syscall
