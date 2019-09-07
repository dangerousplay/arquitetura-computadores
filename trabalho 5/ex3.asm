# Exercício 3: Escreva um programa em assembly que faça o mesmo que o programa em C abaixo:

#/* procedimento e tabela ASCII */

#int vet[5] = {0x12, 0x13, 0x14, 0x15, 0x16};

#int print_vet(void)
#{
#     int i;
#
#     for (i = 0; i < 5; i++)
#          printf(“vet pos %d = %d\n”, i, vet[i]);
#
#     return 0;
#}
#
#int main(void)
#{
#     return print_vet();
#}

.data
    vet: .word 0x12 0x13 0x14 0x15 0x16
    size: .word 5

    pos: .asciiz "vet pos "
    equals: .asciiz " = "
    newline: .asciiz "\n"

.text

main:
    la $t1, vet
    la $t2, size
    lw $t2, ($t2)
    li $t3, 0
    la $t4, pos
    la $t5, equals
    la $t7, newline

    jal print_vec

    li $v0, 10
    syscall

print_vec:
    bge $t3, $t2, return_main
    lw $t6, ($t1)

    li $v0, 4
    move $a0, $t4
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 4
    move $a0, $t5
    syscall

    li $v0, 1
    move $a0, $t6
    syscall

    li $v0, 4
    move $a0, $t7
    syscall

    addi $t1, $t1, 4
    addi $t3, $t3, 1
    j print_vec

return_main:
    jr $ra

