.data
.text
.globl main
main:
	#Start Test
	addi $t0, $0, -1 	 # Load 0xFFFF_FFFF
	xori $t1, $1, -21846 # $t1 = 0xFFFF_FFFF ^ 0xAAAA
					 	 # This should result in register t1 being set to 0xFFFF_3333
					 	 # This checks that only certain bits are inverted as should happen
	#End Test

	#Exit Program
	li $v0, 10
	syscall
