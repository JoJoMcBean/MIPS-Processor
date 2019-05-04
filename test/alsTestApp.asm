#
# test arithmetic/logical/shift instructions
#

# data section
.data

# code/instruction section
.text
addi  $1,  $0,  1 	#1:1
addu  $2,  $1,  $1	#2:2
add  $3, $1, $2 	#3:3
addiu $4, $0, -1	#4:-1
and $5, $2, $3		#5:2
andi $6, $4, 3		#6:3
lui $7, 7			#7:7*2^16
nor $8, $1, $2		#8:-4
ori $9, $6, 5		#9:7
or $10, $3, $2		#10:3
xor $11, $9, $3		#11:4
xori $12, $11, 7	#12:3
subu $13, $11, $8	#13:8
slt $14, $3, $2		#14:0
slti $15, $4, 2		#15:1
sltiu $16, $4, 2	#16:0
sltu $17, $2, $3	#17:1
sll $18, $3, 2		#18:12
srl $19, $4, 1		#19:-1>>1
sra $20, $4, 1		#20:-1

		
addi  $2,  $0,  10	# Place "10" in $v0
syscall				# Cause the halt

