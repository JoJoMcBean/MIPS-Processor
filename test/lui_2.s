.data
.text
.globl main
main:

    # Start Test
  lui $1, 0xFFFF #verify fully full in upper

  # End Test

  # Exit program
  li $v0, 10
  syscall
