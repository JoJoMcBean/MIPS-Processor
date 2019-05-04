.data
	myVar: .word 0x12
	.word 0x23
	.word 0x34
	.word 0x45
.text
.globl main
main:
    # Start Test
  
  	la $s2 myVar
  
	lw $2, 4($s2)
	lw $3, 8($s2)
	lw $4, 12($s2)
	lw $5, 4($s2)

	# end test
	
    # Exit program
    li $v0, 10
    syscall
