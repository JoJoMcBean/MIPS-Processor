#
# Just a sample, simple example asm code that does not do any meaningful task
#

# data section
.data
fibs:.word   5,2,3,4,1         # "array" of words to contain fib values
#nonzero integer array starting at address 0
# code/instruction section
.text
la $8, fibs
andi $1, $0, 0
scan:
sll $9, $1, 2
add $9, $8, $9
lw $2, 0($9)
beq $2, $0 main		#2 is used for conditional calculation
addi $1, $1, 1 #1 stores number of ints, aka N 
addi $9, $9, 4
j scan
main:
andi $3, $0, 0		#3 stores loop 1 counter, initialize $3 = 0
L1:
addi $2, $1, -1		#2 = n-1
slt $2, $3, $2		#store 1 in $2 if $3 < n-1
beq $2, $0 exit	
andi $4, $0, 0		#initalize $4 = 0 for loop 2
L2:
sub $2, $1, $3
addi $2, $2, -1		#store n-i-1 in $2
slt $2, $4, $2	
beq $2, $0 LI1		#branch if $4 < n-$3-1
sll $9, $4, 2
add $9, $9, $8
lw $5, 0($9)		#arr[$4] to reg 5
lw $6, 4($9)		#arr[$4+1] to reg 6
slt $2, $6, $5
beq $2, $0 LI2		#swap if $6 < $5 
sw $6, 0($9)
sw $5, 4($9)
LI2:
addi $4, $4, 1
j L2
LI1:
addi $3, $3, 1
j L1
exit:
li   $v0, 10          # system call for exit
syscall               # Exit! 1001
