.data
.text
.globl main
main:
# I've used the the following cases to test if slt MIPS instructions is tested correctly. 



#stress test instruction for SLT case 1 
#starting test 
addi $t2, $zero, 4 #setting $t2 to immediate value of 4 
addi $t3, $zero, 10 #setting $t3 to immediate vaule of 10
slt $t1, $t2, $t3 #if register t2 is less then t3 then t1 will be set to 0 otherwise, t1 is set to 1
# in this case slt instruction gets placed and will set the vaule of t1 to 0 which is what we want. 

# Exit program
li $v0, 10
syscall

