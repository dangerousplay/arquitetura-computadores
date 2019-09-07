# Exercício 4: Implemente um algoritmo de divisão de 10 por 3 usando subtrações
# sucessivas.
# [Dividendo] [Divisor] [Dividendo-Divisor] Contador
# 10 3 7 1
# 7 3 4 2
# 4 3 1 3
# dividendo divisor resto quociente

.data
   dividendo:  .word 0xA
   divisor:  .word 0x3
   quociente: .word 0x0
   resto: .word 0x0
.text
         li $a0, 0 # Atribui o valor 0 ao registrador
         li $t0, 0 # Atribui o valor 0 ao registrador
         la $s1,dividendo # Carrega o endereço de dividendo para o registrador
         la $s2,divisor # Carrega o endereço de divisor para o registrador
         la $s3,quociente # Carrega o endereço de quociente para o registrador
         la $s4,resto # Carrega o endereço de resto para o registrador
         lw $t1, ($s1) # Carrega o valor que está em dividendo
         lw $t2, ($s2) # Carrega o valor que está em divisor
         lw $t3, ($s3) # Carrega o valor que está em quociente
         lw $t4, ($s4) # Carrega o valor que está em resto
    while_division:
    	blt $t1, $t2, end_division
    	sub $t1, $t1, $t2
    	addi $t3, $t3, 1
    	j while_division
    end_division:
   	sw $t3, ($s3)
   	sw $t1, ($s4)