.data
.text
.globl main
main:
    # Start Test
    addi $2, $0, 1     # set test value
    or   $2, $2, $0    # verify that one can bitwise or to maintain a value.
    addi $3, $0, 2     # set test value
    or   $3, $3, $0    # verify that one can bitwise or to maintain a value.
    addi $4, $0, 4     # set test value   
    or   $4, $4, $0    # verify that one can bitwise or to maintain a value.
    addi $5, $0, 8     # set test value
    or   $5, $5, $0    # verify that one can bitwise or to maintain a value.
    addi $6, $0, 16    # set test value
    or   $6, $6, $0    # verify that one can bitwise or to maintain a value.
    addi $7, $0, 32    # set test value
    or   $7, $7, $0    # verify that one can bitwise or to maintain a value.
    addi $8, $0, 64    # set test value
    or   $8, $8, $0    # verify that one can bitwise or to maintain a value.
    addi $9, $0, 128   # set test value
    or   $9, $9, $0    # verify that one can bitwise or to maintain a value.
    addi $10, $0, 256   # set test value
    or   $10, $10, $0    # verify that one can bitwise or to maintain a value.
    addi $11, $0, 512   # set test value
    or   $11, $11, $0    # verify that one can bitwise or to maintain a value.
    addi $12, $0, 1024   # set test value
    or   $12, $12, $0    # verify that one can bitwise or to maintain a value.
    addi $13, $0, 2048   # set test value
    or   $13, $13, $0    # verify that one can bitwise or to maintain a value.
    addi $14, $0, 4096   # set test value
    or   $14, $14, $0    # verify that one can bitwise or to maintain a value.
    addi $15, $0, 8192   # set test value
    or   $15, $15, $0    # verify that one can bitwise or to maintain a value.
    addi $16, $0, 16384   # set test value
    or   $16, $16, $0    # verify that one can bitwise or to maintain a value.
    addi $17, $0, 32768   # set test value
    or   $17, $17, $0    # verify that one can bitwise or to maintain a value.
    addi $18, $0, 65536   # set test value
    or   $18, $18, $0    # verify that one can bitwise or to maintain a value.
    addi $19, $0, 131072  # set test value
    or   $19, $19, $0    # verify that one can bitwise or to maintain a value.
    addi $20, $0, 262144  # set test value
    or   $20, $20, $0    # verify that one can bitwise or to maintain a value.
    addi $21, $0, 524288  # set test value
    or   $21, $21, $0    # verify that one can bitwise or to maintain a value.
    addi $22, $0, 1048576  # set test value
    or   $22, $22, $0    # verify that one can bitwise or to maintain a value.
    addi $23, $0, 2097152  # set test value
    or   $23, $23, $0    # verify that one can bitwise or to maintain a value.
    addi $24, $0, 4194304  # set test value   
    or   $24, $24, $0    # verify that one can bitwise or to maintain a value.
    addi $25, $0, 8388608  # set test value
    or   $25, $25, $0    # verify that one can bitwise or to maintain a value.
    addi $26, $0, 16777216  # set test value
    or   $26, $26, $0    # verify that one can bitwise or to maintain a value.
    addi $27, $0, 33554432  # set test value
    or   $27, $27, $0    # verify that one can bitwise or to maintain a value.
    addi $28, $0, 67108864  # set test value
    or   $28, $28, $0    # verify that one can bitwise or to maintain a value.
    addi $29, $0, 134217728  # set test value
    or   $29, $29, $0    # verify that one can bitwise or to maintain a value.
    addi $30, $0, 268435456  # set test value
    or   $30, $30, $0    # verify that one can bitwise or to maintain a value.
    addi $31, $0, 536870912  # set test value
    or   $31, $31, $0    # verify that one can bitwise or to maintain a value.
    
    # End Test

    # Exit program
    li $v0, 10
    syscall
