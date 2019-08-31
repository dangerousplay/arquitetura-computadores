# Exercício 3: Desenvolver um algoritmo com loop que compute um vetor contendo os
# elementos comuns a 2 vetores. Em comuns deve ser armazenado o número de elementos
# comuns. O tamanho dos vetores é igual a todos.
# .data
# V1: .word 0x12 0xff 0x3 0x14 0x878
# V2: .word 0x12 0x3 0x33 0x4 0x5
# V3: .word 0x0 0x0 0x0 0X0 0x0
# size: .word 5

.data
   V1:  .word 0x12 0xff 0x3 0x14 0x878
   V2:  .word 0x12 0x3 0x33 0x4 0x5
   V3:  .word 0x0 0x0 0x0 0X0 0x0
   size: .word 5
   comuns: .word 0
.text
         la $s0,V1 # Carrega o endereço de V1 para o registrador
         la $s1,V2 # Carrega o endereço de V2 para o registrador
         la $s2,V3 # Carrega o endereço de V3 para o registrador
         move $s3, $s1 #Registrador para iterar v2
         la $t1, comuns # Carregando o valor que está em comuns
         lw $t1, ($t1)
         la $t2, size # Carregando o valor que está em size
         lw $t2, ($t2)
         li $t3, 0 #inicializando com zero
         li $t4, 0 #inicializando com zero
         li $t5, 0 #inicializando com zero
main_for:
	bge $t3, $t2, end_main_for # Encerra o loop quando terminar as iterações
	lw $a0, ($s0) # carrega o argumento para a chamada
	jal for_find_comum # Chama o bloco para procurar os números na lista
	addi $t3, $t3, 1 # incrementa o for do loop
	addi $s0, $s0, 4 # Incrementa o item a ser pegado do vetor
	move $t4, $zero # zera o elemento de iteração
	move $s3, $s1 # Zera o ponteiro para o segundo vetor
	j main_for # retorna ao loop

for_find_comum:
	bge $t4, $t2, return_main_loop # Encerra o loop quando terminar as iterações
	lw $a1, ($s3) # Carrega o valor do segundo vetor
	beq $a1, $a0, add_comum # se forem iguais, adiciona ao vetor 3
	j increment_for_find # incremeta o for

return_main_loop:
	jr $ra # Volta ao bloco que foi chamado

increment_for_find:
	addi $t4, $t4, 1 # Incrementando as iterações realizadas
	addi $s3, $s3, 4 # Incrementando ponteiro para o vetor 2
	j for_find_comum # retorna ao loop

add_comum:
	sw $a1, ($s2) # Guarda na array o valor comum
	addi $s2, $s2, 4 # Incrementa o ponteiro
	addi $t1, $t1, 1 # incrementa o número de elementos encontrados
	j increment_for_find # incrementa o loop

end_main_for:
