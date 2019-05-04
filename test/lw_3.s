.data
	myVar: .word 0x12
.text
.globl main
main:
    # Start Test
  
  	la $s2 myVar
  
	lw $2, ($s2) # no immediate
	lw $3, ($s2)

	# end test
	
    # Exit program
    li $v0, 10
    syscall
