main:
	ori $s0, $zero 0x1234
	j skip
	sll $0, $0, 0
	li $s0 0xffffffff
skip:
	ori $s1 $zero 0x1234
	sll $0, $0, 0
	sll $0, $0, 0
	sll $0, $0, 0
	beq $s0 $s1 skip2
	li $s0 0xffffffff
skip2:
	jal fun
	ori $s3 $zero 0x1234
	
	beq $s0, $zero exit
	ori $s4 $zero 0x1234
	j exit

fun:
	ori $s2 $zero 0x1234
	addi  $1,  $0,  1 	#1:1
	sll $0, $0, 0
	sll $0, $0, 0
	sll $0, $0, 0
	addu  $2,  $1,  $1	#2:2
	sll $0, $0, 0
	sll $0, $0, 0
	sll $0, $0, 0
	add  $3, $1, $2 	#3:3
	addiu $4, $0, -1	#4:-1
	sll $0, $0, 0
	sll $0, $0, 0
	and $5, $2, $3		#5:2
	sll $0, $0, 0
	sll $0, $0, 0
	andi $6, $4, 3		#6:3
	lui $7, 7			#7:7*2^16
	nor $8, $1, $2		#8:-4
	sll $0, $0, 0
	ori $9, $6, 5		#9:7
	or $10, $3, $2		#10:3
	sll $0, $0, 0
	sll $0, $0, 0
	xor $11, $9, $3		#11:4
	sll $0, $0, 0
	sll $0, $0, 0
	sll $0, $0, 0
	xori $12, $11, 7	#12:3
	subu $13, $11, $8	#13:8
	slt $14, $3, $2		#14:0
	slti $15, $4, 2		#15:1
	sltiu $16, $4, 2	#16:0
	sltu $17, $2, $3	#17:1
	sll $18, $3, 2		#18:12
	srl $19, $4, 1		#19:-1>>1
	sra $20, $4, 1		#20:-1
	jr $ra
exit:
	li   $v0, 10          # system call for exit
      	syscall               # Exit!