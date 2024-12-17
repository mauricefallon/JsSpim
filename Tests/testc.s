#2023
# the data to be used by the program
# arr is an array, len is the length of the array
.data
arr: .word  2, 4, 1, 8, 10
len: .word  5

# the main program
.text
main:
   li $t0, 0    #l11
   li $t1, 1    #l12
   lw $t7, len  #l13

check:
   bge $t0, $t7, exit
   sll $t6, $t0, 2
   lw  $t2, arr($t6)
   # arr() enables you to access an element of the array arr
   andi  $t3, $t2, 1
   bne   $t3, $zero, change
   addi  $t0, $t0, 1
   j     check

change:
   li    $t1, 0

exit:
   # the following lines end the program
   li    $v0, 10
   syscall
