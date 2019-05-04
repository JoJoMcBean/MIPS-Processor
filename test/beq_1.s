.data
.text
.globl main
main:
    # Start Test
    addi $5, $0, 5        #initialize $5 to 5
    addi $1, $0, 0        #set $1 to 0
    addi $2, $0, 0        #set $2 to 0
    beq  $1, $2, branch   #if $1 == $2 then branch to branch

    # Exit program
    li $v0, 10
    syscall

    branch:
    addi $5, $0, 10       #change value of $5 to confirm branch

    #exit after branch
    li $v0, 10
    syscall
    #end test, if the branch was successful $5 should contain the value 10.
