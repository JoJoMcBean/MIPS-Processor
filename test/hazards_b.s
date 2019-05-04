addi $3, $0, 4
addi $1, $0, 1
add $2, $1, $0 #fwd memwb -> idex
add $2, $1, $2 #fwd exmem -> idex
add $2, $1, $2 #fwd exmem -> rfa
add $2, $1, $2 #normal rf read
lui $1, 0x1000
sw $2, 0($1)
addi $2, $0, 0
lw $2, 0($1) 
add $2, $2, $2 #can't fwd from memwb so 1 cycle delay
ori $2, $0, 10
syscall