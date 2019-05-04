.data
.text
.globl main
main:
    # Start Test
    xor $1, $0, $0      # verify that one can clear registers and 0XOR0 works in the ALU 
    xor $2, $0, $0      # verify that one can clear registers and 0XOR0 works in the ALU 
    xor $3, $0, $0     # verify that one can clear registers and 0XOR0 works in the ALU   
    xor $4, $0, $0     # verify that one can clear registers and 0XOR0 works in the ALU   
    xor $5, $0, $0     # verify that one can clear registers and 0XOR0 works in the ALU   
    xor $6, $0, $0     # verify that one can clear registers and 0XOR0 works in the ALU   
    xor $7, $0, $0     # verify that one can clear registers and 0XOR0 works in the ALU   
    xor $8, $0, $0     # verify that one can clear registers and 0XOR0 works in the ALU   
    xor $9, $0, $0     # verify that one can clear registers and 0XOR0 works in the ALU   
    xor $10, $0, $0     # verify that one can clear registers and 0XOR0 works in the ALU   
    xor $11, $0, $0     # verify that one can clear registers and 0XOR0 works in the ALU   
    xor $12, $0, $0     # verify that one can clear registers and 0XOR0 works in the ALU   
    xor $13, $0, $0     # verify that one can clear registers and 0XOR0 works in the ALU   
    xor $14, $0, $0     # verify that one can clear registers and 0XOR0 works in the ALU   
    xor $15, $0, $0     # verify that one can clear registers and 0XOR0 works in the ALU   
    xor $16, $0, $0     # verify that one can clear registers and 0XOR0 works in the ALU   
    xor $17, $0, $0     # verify that one can clear registers and 0XOR0 works in the ALU   
    xor $18, $0, $0     # verify that one can clear registers and 0XOR0 works in the ALU   
    xor $19, $0, $0     # verify that one can clear registers and 0XOR0 works in the ALU   
    xor $20, $0, $0     # verify that one can clear registers and 0XOR0 works in the ALU   
    xor $21, $0, $0     # verify that one can clear registers and 0XOR0 works in the ALU   
    xor $22, $0, $0     # verify that one can clear registers and 0XOR0 works in the ALU   
    xor $23, $0, $0     # verify that one can clear registers and 0XOR0 works in the ALU   
    xor $24, $0, $0     # verify that one can clear registers and 0XOR0 works in the ALU   
    xor $25, $0, $0     # verify that one can clear registers and 0XOR0 works in the ALU   
    xor $26, $0, $0     # verify that one can clear registers and 0XOR0 works in the ALU   
    xor $27, $0, $0     # verify that one can clear registers and 0XOR0 works in the ALU   
    xor $28, $0, $0     # verify that one can clear registers and 0XOR0 works in the ALU   
    xor $29, $0, $0     # verify that one can clear registers and 0XOR0 works in the ALU   
    xor $30, $0, $0     # verify that one can clear registers and 0XOR0 works in the ALU   
    xor $31, $0, $0     # verify that one can clear registers and 0XOR0 works in the ALU   
    # End Test

    # Exit program
    li $v0, 10
    syscall
