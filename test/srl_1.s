.text
.globl main
main: # Start program

li $t0, 0x11111111
srl $t1, $t0, 1 
srl $t1, $t0, 7 
srl $t1, $t0, 31 

exit: # Exit program
  li $v0, 10
  syscall
