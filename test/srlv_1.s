
##test case 1: i choose to shift by 2, then load address so we can shift
li       $t1, 2
li       $t2, 0x0AAAAAA     # $t2 = 0000 1010 1010 1010 1010 1010 1010 1010
srlv     $t3, $t2, $t1       # $t3 = 0000 0010 1010 1010 1010 1010 1010 1010

li $v0, 10
syscall