.data
.text
.globl main
main:

    # Start Test
  lui $1, 0xABCD #verify ABCD goes into upper 16 bits

  # End Test

  # Exit program
  li $v0, 10
  syscall
