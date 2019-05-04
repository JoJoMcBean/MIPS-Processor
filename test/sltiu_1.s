.data
.text
.globl main
main:
    # Start Test

	#positive, nagative, 0 cross check
    addi $1, $0, 2       # store 1 to $1
    sltiu $2, $1, 0      # positive register value bigger than imm 0
	sltiu $3, $1, 1      # positive register value bigger than positive imm
	sltiu $4, $1, 2      # positive register value equals to positive imm
	sltiu $5, $1, 3      # positive register value less than positive imm
	sltiu $6, $1, 123  # positive register value bigger than negative imm
	addi $1, $0, -2   # store -2 to $1
	sltiu $2, $1, 0      # negative register value less than imm 0
	sltiu $3, $1, -1  # negative register value less than negative imm
	sltiu $4, $1, -2  # negative register value equals to negative imm
	sltiu $5, $1, -1  # negative register value less than negative imm
	sltiu $6, $1, 2      # negative register value less than positive imm
	add $1, $0, $0       # store 0 to $1
    sltiu $2, $1, -1  # register value 0 bigger than negative imm
	sltiu $3, $1, 0      # register value 0 equals to imm 0
	sltiu $4, $1, 1      # register value 0 less than positive imm

	# End Test

    # Exit program
    li $v0, 10
    syscall
