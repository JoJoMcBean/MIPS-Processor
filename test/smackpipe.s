#
# Just a sample, simple example asm code that does not do any meaningful task
#

# data section
.data
fibs:.word   5,2,3,4,1         # "array" of words to contain fib values
#nonzero integer array starting at address 0
# code/instruction section
.text
lui $8,4097
sw $8 0($8)
lw $1 0($8)
beq $1, $1, L1
L1:
lw $1 0($8)
beq $1, $1, L2
L2:
lw $1 0($8)
beq $1, $1, L3
L3:
lw $1 0($8)
beq $1, $1, L4
L4:
lw $1 0($8)
beq $1, $1, L5
L5:
lw $1 0($8)
beq $1, $1, L6
L6:
lw $1 0($8)
beq $1, $1, L7
L7:
lw $1 0($8)
beq $1, $1, exit
exit:
li $v0, 10
syscall
