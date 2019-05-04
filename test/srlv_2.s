## in this test case, i shifted by the amount of 2, so i move all numbers 2 places to the right
##test case 2: shift by 3
li       $t1, 3
li       $t2, 0xFFFFFFFF     # $t2 = 1111 1111 1111 1111 1111 1111 1111 1111
srlv     $t3, $t2, $t1       # $t3 = 0011 1111 1111 1111 1111 1111 1111 1111

li $v0, 10
syscall