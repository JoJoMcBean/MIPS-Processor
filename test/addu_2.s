#Testing Exceptional Behavior (no overflow flags are set)
#dependencies: addi, lui, and ori instructions (to preload registers with values)

.data
.text
.globl main

main:
	#preload register 2 with 0x7FFFFFFF and register 3 with 0x01
	lui $1, 32767
	ori $2, $1, 65535
	addi $3, $0, 1
	addi $7, $0, 5
	
	#Start Test
	addu $4, $2, $0  # add 0 to  0x7FFFFFFF should be no overflow
	addu $5, $2, $3  # add 1 to  0x7FFFFFFF should be no overflow
	addu $6, $2, $7  # add 5 to  0x80000000 should be no overflow
	#End Test

   	 # Exit program
   	 li $v0, 10
   	 syscall
