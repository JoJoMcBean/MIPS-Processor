.data
.text
.globl main
main:

    # Start Test
  lui $1, 0x0000 #verify full clear in upper

  # End Test

  # Exit program
  li $v0, 10
  syscall
