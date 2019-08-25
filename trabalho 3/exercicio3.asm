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
         li $a0, 0 # Atribui o valor 0 ao registrador
         li $t0, 0 # Atribui o valor 0 ao registrador
         la $s1,V1 # Carrega o endereço de V1 para o registrador
         la $s2,V2 # Carrega o endereço de V2 para o registrador
         la $s3,V3 # Carrega o endereço de V3 para o registrador
         la $s4,comuns
         li $s5, 0
   forsum:    # Define o loop do FOR
         bge $s0, 5, end_forsum  # Verifica o número de iterações realizadas, pulando quando tiver feito 5 iterações
         lw $t1,($s1) # Carrega o valor atual da memória
         lw $t2,($s2) # Carrega o valor atual da memória
         beq $t1, $t2, add_comum
         j increment_for
   add_comum:
         sw $t1, ($s3) # Move para a memória o valor do registrador
         addi $s5,$s5, 1 # Incrementa o número de elementos comuns
         j increment_for
   increment_for:
         addi $s0,$s0,1 # Incrementa o índice do FOR
         addi $s1,$s1,4 # Incrementa o offset do ponteiro
         addi $s2,$s2,4 # Incrementa o offset do ponteiro
         addi $s3,$s3,4 # Incrementa o offset do ponteiro
         j forsum #Retorna ao bloco FORSUM
   end_forsum:
         sw $s5, ($s4) # Move para a memória o valor do registrador
