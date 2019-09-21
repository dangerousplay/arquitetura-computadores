#Exercício 3: Construa um programa assembly e apresente a execução do simulador MARS para a seguinte especificação: 
#.data                    
#A_low:    .word   0x80000000  
#A_high:   .word   0x34ff  
#B_low:    .word   0x80000000  
#B_high:   .word   0x2f  
#C_low:    .word   0x0 
#C_high:   .word   0x0 
 
#Dados dois números A e B de 64 bits, apresentar o resultado da soma de A e B e armazenar na memória. 
#Os números A e B devem estar presentes na memória em sua parte menos significativa (A_low, B_low) 
#e mais significativa (A_high, B_high).  
#O resultado da soma, valor C, deve ser armazenado na memória em sua parte menso significativa C_low e mais significativa C_high. 

.data                    
A_low:    .word   0x8FF0FFFF  
A_high:   .word   0x34ff  
B_low:    .word   0x8FF0FFFF  
B_high:   .word   0x2f  
C_low:    .word   0x0 
C_high:   .word   0x0 

.text

.globl main
main:
	la $s0, A_low
	lw $s0, ($s0)
	la $s1, A_high
	lw $s1, ($s1)
	
	la $s2, B_low
	lw $s2, ($s2)
	la $s3, B_high
	lw $s3, ($s3)
	
	la $s4, C_low
	la $s5, C_high
	
	move $a0, $s0
	move $a1, $s1
	
	move $a2, $s2
	move $a3, $s3
	
	jal add64
	
	sw $v0, ($s4)
	sw $v1, ($s5)
	
	j end
	
add64: 
       addu  $v0, $a0, $a2    # somandos os bits menos significativos
       nor   $t0, $a2, $zero  # invertendo a2 = ~a2
       sltu  $t0, $t0, $a0    # pegando o carry-in bit (capturando overflow)
       addu  $v1, $t0, $a1    # somando a palavra mais significativa
       addu  $v1, $v1, $a3    # somando a palavra mais significativa
       jr $ra # retornando a chamada
       
 end:  