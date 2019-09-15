#Exercício 2: Implemente um programa em assembly MIPS que implemente o switch case
#do código em C abaixo.

#switch (k) {
#case 0: f = i + j; break;
#case 1: f = g + h; break;
#case 2: f = g - h; break;
#case 3: f = i - j; break;
#}

#Defina valores de i, j, g e h para simulação e simule no MARS.


.text

.globl main

main:
	li $t0, 0 # $T0 = f
	li $t1, 7 # $T1 = g
	li $t2, 45 # $T2 = h
	li $t3, 1 # $T3 = i
	li $t4, 5 # $T4 = j
	li $t5, 0 # $T5 = k

	# SWITCH (k)
	beq $t5, 0, case0
	beq $t5, 1, case1
	beq $t5, 2, case2
	beq $t5, 3, case3
case0:
	#case 0: f = i + j; break;
	add $t0, $t3, $t4
	j end
case1:
	#case 1: f = g + h; break;
	add $t0, $t1, $t2
	j end
case2:
	#case 2: f = g - h; break;
	sub $t0, $t1, $t2
	j end
case3:
	#case 3: f = i - j; break;
	sub $t0, $t3, $t4
	j end
end:


