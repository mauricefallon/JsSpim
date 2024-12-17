Original Code
=============

li $t0, 0
li $t1, 4
loop: beq $t0, $t1, exit
addi $t0, $t0, 1
j loop
exit:



Section (c) (ii)
=============

li $t0, 0
li $t1, 4
move $s0, $zero                #added0
loop: beq $t0, $t1, exit
add $s0, $t0, $s0              #added1
addi $t0, $t0, 1
j loop
exit:



Section (d)
=============

SumAll:
addi $sp, $sp, -4
sw $s0, 0($sp)
li $t0, 0                      #0
move $t1, $a0
move $s0, $zero                #added0
loop: beq $t0, $t1, exit       #2
add $s0, $t0, $s0              #added1
addi $t0, $t0, 1               #3
j loop                         #4
exit:                          #5
move $v0, $s0
lw $s0, 0($sp)
addi $sp, $sp, 4
jr $ra

main:
li $a0, 4
jal SumAll
jr $ra
