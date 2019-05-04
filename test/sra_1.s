.data
.text
.globl main
main:
    #start test
    addi $1, $0, 0   #tests register 1, sets it for 0 for sra
    sra $2,$1, 1    #tests a shift of 1 in regsiter 1, this allows to clearly see a arithmetic shift right
    sra $3,$1, 2    #tests a shift of 2 from register 1
    sra $4,$1, 3    #tests a shift of 3 from register 1
    sra $5,$1, 4    #tests a shift of 4 from register 1
    sra $6,$1, 5    #tests a shift of 5 from register 1
    sra $7,$1, 6    #tests a shift of 6 from register 1
    sra $8,$1, 7    #tests a shift of 7 from register 1
    sra $9,$1, 8    #tests a shift of 8 from register 1    
    sra $10,$1, 9    #tests a shift of 9 from register 1
    sra $11,$1, 10   #tests a shift of 10 from register 1
    sra $12,$1, 11   #tests a shift of 11 from register 1
    sra $13,$1, 12   #tests a shift of 12 from register 1
    sra $14,$1, 13   #tests a shift of 13 from register 1
    sra $15,$1, 14   #tests a shift of 14 from register 1
    sra $16,$1, 15   #tests a shift of 15 from register 1
    sra $17,$1, 16   #tests a shift of 16 from register 1
    sra $18,$1, 17   #tests a shift of 17 from register 1     
    sra $19,$1, 18   #tests a shift of 18 from register 1
    sra $20,$1, 19   #tests a shift of 19 from register 1
    sra $21,$1, 20   #tests a shift of 20 from register 1
    sra $22,$1, 21   #tests a shift of 21 from register 1
    sra $23,$1, 22   #tests a shift of 22 from register 1
    sra $24,$1, 23   #tests a shift of 23 from register 1
    sra $25,$1, 24   #tests a shift of 24 from register 1
    sra $26,$1, 25   #tests a shift of 25 from register 1
    sra $27,$1, 26   #tests a shift of 26 from register 1    
    sra $28,$1, 27   #tests a shift of 27 from register 1
    sra $29,$1, 28   #tests a shift of 28 from register 1
    sra $30,$1, 29   #tests a shift of 29 from register 1
    sra $31,$1, 30   #tests a shift of 30 from register 1
    #end test
    # Exit program
    li $v0, 10
    syscall