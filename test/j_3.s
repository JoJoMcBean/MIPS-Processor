.text
.globl main
main:
    ori $t0, $zero, 0x1234
    j end
    ori $t0, $zero, 0x1234
    ori $t0, $zero, 0x1234
    ori $t0, $zero, 0x1234
    ori $t0, $zero, 0x1234
    ori $t0, $zero, 0x1234
    ori $t0, $zero, 0x1234
    ori $t0, $zero, 0x1234
    ori $t0, $zero, 0x1234
    ori $t0, $zero, 0x1234
    ori $t0, $zero, 0x1234
    ori $t0, $zero, 0x1234
end:
    # Exit program
    li $v0, 10
    syscall