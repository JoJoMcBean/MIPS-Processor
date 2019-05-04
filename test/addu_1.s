#Testing range of operand values
#dependencies: addi instruction (to preload registers with values)

.data
.text
.globl main

main:
	#preload registers 1 and 2
	addi $1, $0, 1

	#Start Test
	addu $2, $1, $0  # verify that we can add with zero register correctly
	addu $3, $1, $2  # verify that we can add 2 previous registers in to the next
	addu $4, $1, $3  # verify that we can add 2 previous registers in to the next
	addu $5, $1, $4  # verify that we can add 2 previous registers in to the next
	addu $6, $1, $5  # verify that we can add 2 previous registers in to the next
	addu $7, $1, $6  # verify that we can add 2 previous registers in to the next
	addu $8, $1, $7  # verify that we can add 2 previous registers in to the next
	addu $9, $1, $8  # verify that we can add 2 previous registers in to the next
	addu $10, $1, $9  # verify that we can add 2 previous registers in to the next
	addu $11, $1, $10  # verify that we can add 2 previous registers in to the next
	addu $12, $1, $11  # verify that we can add 2 previous registers in to the next
	addu $13, $1, $12  # verify that we can add 2 previous registers in to the next
	addu $14, $1, $13  # verify that we can add 2 previous registers in to the next
	addu $15, $1, $14  # verify that we can add 2 previous registers in to the next
	addu $16, $1, $15  # verify that we can add 2 previous registers in to the next
	addu $17, $1, $16  # verify that we can add 2 previous registers in to the next
	addu $18, $1, $17  # verify that we can add 2 previous registers in to the next
	addu $19, $1, $18  # verify that we can add 2 previous registers in to the next
	addu $20, $1, $19  # verify that we can add 2 previous registers in to the next
	addu $21, $1, $20  # verify that we can add 2 previous registers in to the next
	addu $22, $1, $21  # verify that we can add 2 previous registers in to the next
	addu $23, $1, $22  # verify that we can add 2 previous registers in to the next
	addu $24, $1, $23  # verify that we can add 2 previous registers in to the next
	addu $25, $1, $24  # verify that we can add 2 previous registers in to the next
	addu $26, $1, $25  # verify that we can add 2 previous registers in to the next
	addu $27, $1, $26  # verify that we can add 2 previous registers in to the next
	addu $28, $1, $27  # verify that we can add 2 previous registers in to the next
	addu $29, $1, $28  # verify that we can add 2 previous registers in to the next
	addu $30, $1, $29  # verify that we can add 2 previous registers in to the next
	addu $31, $1, $30  # verify that we can add 2 previous registers in to the next
	#End Test

   	 # Exit program
   	 li $v0, 10
   	 syscall
