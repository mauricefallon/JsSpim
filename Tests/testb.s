# 2022 exam
.text
main:
li $a0, 6
jal SumAll
jr $ra
syscall

SumAll:
addi $sp, $sp, -4
sw $s0, 0($sp)

# li - load immediate - sets $t0 to be 0
# $t0 will be the for loop counter 0->6
li $t0, 0                  #0 sets $t0 to be 0

# test up the maximum value of t1=6
move $t1, $a0
# test the current value to be 0
move $s0, $zero            #a0 puts zero into $s0

# loop from t0 [0] to t1 [6] and then jump to exit
loop: beq $t0, $t1, exit   #2
add $s0, $t0, $s0          #a1 add t0 to s0
addi $t0, $t0, 1           #3 i++
j loop                     #4 end loop
exit:                      #5
move $v0, $s0         # move s0 to v0
lw $s0, 0($sp)        # put the result in the stack
addi $sp, $sp, 4
jr $ra

.data
prompt: .asciiz "The code is based on Adel Zare's answer at <a href='https://stackoverflow.com/questions/22976456'>StackOverflow</a>\nThis program calculates Fibonacci sequence from 1 to n.\nPlease enter a non-negative number n:\n"
result: .asciiz "F_"
result2: .asciiz " = "
endl: .asciiz "\n"
