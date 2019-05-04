.data
.text
.globl main
main:
    # Start Test
    addi $1, $0, 2       # verify that one can immediately add 0+2 works in the ALU   
    addi $3, $1, 4       # verify that one can immediately add value in $1+4 "2+4" works in the ALU   
    addi $5, $3, 8       # verify that one can immediately add value in $1+4 "6+8" works in the ALU   
    addi $7, $5, 16      # verify that one can immediately add value in $1+4 "14+16" works in the ALU    
    addi $9, $7, 32      # verify that one can immediately add value in $1+4 "30+32" works in the ALU    
    addi $11, $9, 64     # verify that one can immediately add value in $1+4 "62+64" works in the ALU   
    addi $13, $11, 128   # verify that one can immediately add value in $1+4 "126+128" works in the ALU    
    addi $15, $13, 256   # verify that one can immediately add value in $1+4 "254+256" works in the ALU    
    addi $17, $15, 512   # verify that one can immediately add value in $1+4 "510+512" works in the ALU   
    addi $19, $17,1024   # verify that one can immediately add value in $1+4 "1022+1024" works in the ALU   
    addi $21, $19,2048   # verify that one can immediately add value in $1+4 "2046+2048" works in the ALU   
    addi $23, $21,4096   # verify that one can immediately add value in $1+4 "4094+4096" works in the ALU   
	addi $25, $23,8192   # verify that one can immediately add value in $1+4 "8190+8192" works in the ALU   
	# End Test

    # Exit program
    li $v0, 10
    syscall
