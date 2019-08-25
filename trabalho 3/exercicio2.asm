#Exercício 2: Implementar um algoritmo em assembly que multiplique dois números
# conforme a expressão escrita em linguagem C abaixo:
# int a, b, soma;
# a = valor1
# b = valor2;
# soma = a * b;
# Existe alguma limitação no seu algoritmo de multiplicação? Qual seria?
#
# Existem várias limitações, o valor máximo que pode ser carregado para ser multiplicado não pode ultrapassar o limite do registrador de 32 bits.
# Além de que o resultado da multiplicação para não ter overflow ou underflow.

.data
   a:  .word 0x122
   b:  .word 0x122
   soma:  .word 0x0
.text
         li $a0, 0 # Atribui o valor 0 ao registrador
         li $t0, 0 # Atribui o valor 0 ao registrador
         lw $s1, a # Carrega o valor de a para o registrador
         lw $s2, b # Carrega o valor de b para o registrador
         la $s4, soma # Carrega o endereço de soma
         mul $s3, $s1, $s2 # Faz $s3 = a*b
         sw $s3, 0($s4) # Guarda o valor em soma