.data
.text
.globl main
main:

# Start Test
addi $t1, $0, 0xFFFFFFFF # Load maximum immediate value into $t1
ori $t2, $t1, 0xFFFF # Perform ori operation and test to see if bits are preserved 
ori $t3, $t2, 0x00000000 # Performs ori operation to make sure bits are not changed when values are 0's


# Exit program
li $v0, 10
syscall
