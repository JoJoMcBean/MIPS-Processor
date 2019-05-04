.data
.text
.globl main
main:
# Simple Arithmetic betwen mutiple registers
	addi $1, $0, 100 # $1 + 100 = 100 => $1
	addi $3, $1, 200 #$1 + 200 = 300 => $2 tests adding
	addi $4, $3, -100 # $2 + (-100) = 200 => $3 Tests subtraction
	addi $5, $4, -1000 # $3 + (-1000) = -800 => $4 Tests receiving a negative result

# End Test

    # Exit program
    addi $v0, $zero, 10
    syscall
#Test covers basic arithemetic with immediate values, both signed an unsigned.
#Ensures that a properly functioning ALU will be able to handle positive and negative immediate values