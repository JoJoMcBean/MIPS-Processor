.data

#Initializes an ASCII to memory
temp: .ascii  "0123456789ABCDEF"

.text
.globl main

main:
    #Begin Test
    la $s0, temp  #Base addr where the ascii is stored
    addi $s0, $s0, 12 # give us a scenario with a negatave address calculation
    
    lw $t1, 0($s0)      #This should load "CDEF"

    lw $t2, -4($s0)      #This should load "98AB"

    lw $t3, -8($s0)      #This should load "4567"

    lw $t4, -12($s0)     #This should load "0123"
    
    li $v0, 10
    syscall             #Exit
