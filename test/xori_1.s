.data
.text
.globl main
main:
	#Start Test
	addi $t0, $0, -1 # Load 0xFFFF_FFFF
	xori $t1, $1, -1 # $t1 = 0xFFFF_FFFF ^ 0xFFFF
					 # This should result in register t1 being set to 0xFFFF_0000
					 # This checks that the lower 16 bits are all inverted as should happen
					 #	when XOR'd with 1's
	#End Test

	#Exit Program
	li $v0, 10
	syscall
