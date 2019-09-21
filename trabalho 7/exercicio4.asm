#Exercício 4: Construa um programa em assembly e apresente a execução do simulador MARS da simulação para o seguinte programa:
#• Efetuar a multiplicação dos números da seguinte seção .data

# 	.data
#M1:    .word   0x61322
#M2:     .word   0x34ff

#Após efetuar a multiplicação, a parte alta (hi) deve ser somada com 0xb e armazenada no registrador $s1 e a parte baixa do resultado (lo) deve ser somada a 0xc e armazenada em $s2.


.data

M1:    .word   0x61322
M2:    .word   0x34ff

.text
.globl main

main:
	la $t1, M1
	lw $t1, ($t1)
	la $t2, M2
	lw $t2, ($t2)

	mult $t1, $t2

	mfhi $s1
	mflo $s2

	addi $s1, $s1, 0xb
	addi $s2, $s2, 0xc


