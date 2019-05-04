.data
.text
.globl main
main:

# Start Test
addi $t1, $0, 0x01010101 # Load alternating immediate value into $t1
ori $t2, $t1, 0x10101010 # Perform ori operation and test to make sure value is set to 1
ori $t3, $t2, 0x00000000 # Performs ori operation to make sure bits are not changed from 1


# Exit program
li $v0, 10
syscall