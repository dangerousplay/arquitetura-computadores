# V1: .word 0x12 0xff 0x3 0x14 0x878 0x31 0x62 0x10 0x5 0x16 0x20
#  V2: .word 0x12 0xff 0x3 0x14 0x878 0x31 0x62 0x10 0x5 0x16 0x20
#  V3: .word 0x0 0x0 0x0 0X0 0x0 0x0 0x0 0X0 0x0 0x0 0x0
#  size: .word 11
# Exercício 1: Somar dois vetores e posicionar a resposta em um terceiro utilizando loop.

.data
   V1:  .word 0x12 0xff 0x3 0x14 0x878 0x31 0x62 0x10 0x5 0x16 0x20
   V2:  .word 0x12 0xff 0x3 0x14 0x878 0x31 0x62 0x10 0x5 0x16 0x20
   V3:  .word 0x0 0x0 0x0 0X0 0x0 0x0 0x0 0X0 0x0 0x0 0x0
   size: .word 11
   # V1 = {2, 4, 5, 6, 7} e V2 = {1, 3, 2, 3, 8}
.text
         li $a0, 0 # Atribui o valor 0 ao registrador
         li $t0, 0 # Atribui o valor 0 ao registrador
         la $s1,V1 # Carrega o endereço de V1 para o registrador
         la $s2,V2 # Carrega o endereço de V2 para o registrador
         la $s3,V3 # Carrega o endereço de V3 para o registrador
   forsum:    # Define o loop do FOR
         bge $s0, 11, end_forsum  # Verifica o número de iterações realizadas, pulando quando tiver feito 5 iterações
         lw $t1,($s1) # Carrega o valor atual da memória
         lw $t2,($s2) # Carrega o valor atual da memória
         li $a0, 0 # Atribui o valor 0 ao registrador
         add $a0, $t1, $t2 # Faça a adição
         sw $a0, ($s3) # Move para a memória o valor do registrador
         addi $s0,$s0,1 # Incrementa o índice do FOR
         addi $s1,$s1,4 # Incrementa o offset do ponteiro
         addi $s2,$s2,4 # Incrementa o offset do ponteiro
         addi $s3,$s3,4 # Incrementa o offset do ponteiro
         j forsum #Retorna ao bloco FORSUM
   end_forsum:
