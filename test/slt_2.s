.data
.text
.globl main
main:

#stress test instruction for SLT case 2 
#starting test 
addi $t2, $zero, 15 #setting $t2 to immediate value of 15 
addi $t3, $zero, 4  #setting $t3 to immediate value of 4
slt $t1, $t2, $t3 # same test case from previous but the value of $t2 is greater than $t3 
# in this case slt instruction t1 will be set to 0 

# Exit program
li $v0, 10
syscall
