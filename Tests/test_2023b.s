#2023b
# the data to be used by the program
.data
arr: .word
2, 4, 1, 8, 10
len: .word
5
# the main program
.text
main:
li
$t0, 0
li
$t1, 0
lw$t7, len
loop:
bge$t0, $t7, exit
sll
$t6, $t0, 2
lw
$t2, arr($t6)
# arr(...) this is how you access an element of the array arr
add
andi$t1, $t1, $t2
$t3, $t2, 1
addi
j$t0, $t0, 1
loop
exit:
# end of program
li
