# 2024
# the data to be used by the program
.data
qc: .word 0, 0, 1, 0, 0, 1, 0, 1
# 0 indicates good microchip, 1 indicates failure

cost: .word 1, 2, 3, 5, 8, 9, 54, 7
# cost of each microchip

# the main program
.text
main:
move $s6, $zero # sets s6 to 0
move $s7, $zero # sets s7 to 0

move $s2, $zero # sets s2 to 0
li $s3, 1 # sets s3 to 1

loop:
# condition to exit loop
slti $t0, $s2, 8
bne $t0, $s3, exit

# increase index in array
sll $t1, $s2, 2

# load values from array into registers
# t1 must contain a valid index into the array
lw $t2, cost($t1)
lw $t3, qc($t1)

# check if any defected parts and write to s7
or $s7, $s7, $t3

# check if defect and add cost in s6
bne $t3, 1, nextCost
add $s6, $s6, $t2
nextCost:

# count loop iteration and jump
addi $s2, $s2, 1
j loop

exit:
# end of program
li $v0, 10
syscall
