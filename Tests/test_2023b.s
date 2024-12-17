#2023b
# the data to be used by the program
.data
arr: .word 2, 4, 1, 8, 10
len: .word 5
# the main program
.text
main:
li $t0, 0   # set $t0 to 0 - the counter
li $t1, 0   # set $t1 to 0 - the total
lw $t7, len # set $t7 to 5

loop:
bge $t0, $t7, exit # quit when $t0 >= 5
sll $t6, $t0, 2    # shift counter by 2 bytes
lw $t2, arr($t6)   # take the corresponding word from the array 
# arr(...) this is how you access an element of the array arr

add $t1, $t1, $t2  # add the element from arr to the total
andi $t3, $t2, 1   # not sure of the purpose of this. 

addi $t0, $t0, 1   # increment counter by one
j loop             # jump back to top of loop

exit:
# end of program
li $v0, 10         # not sure if this has any effect. sets 10 to $v0
syscall
