main:

        li $t0, 0
        li $t1, 4
        loop: beq $t0, $t1, exit
        addi $t0, $t0, 1
        j loop
        exit:
