#Exercício 3: Implementa um programa em assembly que reproduza o programa em C
#abaixo. Utilize uma sub-rotina para computar o valor da soma. A sub-rotina deve
#preservar o valor de todos os registradores que utilizar na pilha, e após a conclusão do
#cálculo, deve restaurar os valores. Respeite o mapeamento dos registradores para cada
#variável da linguagem alto nível, consulta a tabela do APENDICE A ou slide de aula.

#main()
#{

#int A=21;
#int B=48;
#int C;

#C = soma(A, B);

#}
#soma (int X, int Y)
#{
#return(X+Y);
#}

.text
.globl main

main:
	li $t0, 21
	li $t1, 48
	li $t2, 0
	move $a0, $t1
	move $a1, $t0
	jal soma
	move $t2, $v0
	j end
soma:
	add $v0, $a0, $a1
	jr $ra

end:
