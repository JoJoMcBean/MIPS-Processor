.data
.text
.globl main
main:

# Start Test
addi $t1, $0, 0x00000001 # Load minimum immediate value into $t1
ori $t2, $t1, 0x00000000 # Perform ori operation and test to see if bits are preserved 
ori $t3, $t2, 0xFFFF # Performs ori operation to make sure bits are changed when using maximum immediate value


# Exit program
li $v0, 10
syscall
