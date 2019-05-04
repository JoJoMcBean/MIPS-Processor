.data
.text
.globl main
main:

#stress test instruciton for SLT case 3 
#starting test 
addi $t2, $zero, 5 #setting $t2 to immediate value of 5
addi $t3, $zero, 5 #setting $t3 to immediate value of 6
slt $t1, $t2, $t3 #same test case from the previous cases. value of $t2 is less than $t2 so the value of $t1 will be set to 1 
# in this case slt instruction t1 will be set to 0 

# Exit program
li $v0, 10
syscall
