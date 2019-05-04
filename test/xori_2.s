.data
.text
.globl main
main:
	#Start Test
	addi $t0, $0, -1 # Load 0xFFFF_FFFF
	xori $t1, $t0, 0  # t1 = 0xFFFF_FFFF ^ 0x0000
					 # This should result in register t1 being set to 0xFFFF_FFFF
					 # This checks that the value in register t0 is the same as before
					 # 	as should happen when XOR'd with 0's
	#End Test

	#Exit Program
	li $v0, 10
	syscall
