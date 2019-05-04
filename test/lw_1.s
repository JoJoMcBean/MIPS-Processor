.data

#Initializes an ASCII to memory
temp: .ascii  "0123456789ABCDEF"

.text
.globl main

main:
    #Begin Test
    li $s0, 0x10010000  #Base addr where the ascii is stored
    lw $t1, 0($s0)      #This should load "0123"

    lw $t2, 4($s0)      #This should load "4567"

    lw $t3, 8($s0)      #This should load "89AB"

    lw $t4, 12($s0)     #This should load "CDEF"
    
    li $v0, 10
    syscall             #Exit
