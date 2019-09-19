#Exercício 4: Implemente uma rotina recursiva em linguagem de montagem (assembly)
#para o processador MIPS que tenha por função dividir um número por dois. Siga o
#seguinte código em linguagem C:

#main () {
#int n = 10;
#result div2(n);
#}

#div2(int a) {
#if (a < 2) return 0;
#if (a == 2) return 1;
#return 1 + div2(a - 2);
#}

#Utilize a seguinte área de dados, acrescentando variáveis se considerar necessário:
#.data
#n: .word 10
#result: .word 0

.data
n: .word 2
result: .word 0

.text

.globl main

main:
	la $t0, n
	lw $t0, ($t0) #Carrega o valor de N
	la $t1, result #Carrega o endereço de result

	move $a0, $t0 #Move N para o registrador A0 para fazer a chamada recursiva de DIV2

	jal div2 #Chama o procedimento div2

	sw $v0, ($t1) #Guarda o resultado em Result

	j end #Finaliza o programa

div2:
#div2(int a) {
#if (a < 2) return 0;
#if (a == 2) return 1;
#return 1 + div2(a - 2);
#}

	addi $sp, $sp, -8 #Aloca espaço na stack para o $ra e $a0
	sw   $ra, 0($sp) #Guarda o valor de $ra na stack
	sw   $a0, 4($sp) #Guarda o valor de $a0 na stack

	blt  $a0, 2, return0 #if (a < 2) return 0;
	beq  $a0, 2, return1 #if (a == 2) return 1;

	subi $a0, $a0, 2 # a -= 2;

	jal div2 #div2(a);

	addi $v0, $v0, 1 # 1 + div2(a-2);

exit:
	lw   $ra, 0($sp)        # Faz um POP do valor de $ra para retornar a recursão
        lw   $a0, 4($sp)        # Faz um POP do valor da stack para a0

        addi $sp, $sp, 8       # Retorna o valor original do stack pointer.
        jr $ra #Faz o jump para retornar na recursão

return1:
	li $v0,1 # return 1;
	j exit

return0:
	li $v0,0 # return 0;
	j exit

end:
	#Finaliza a execução do programa.
