
.text
.gobl main
main:

    addu $a1,$a1,$a1 #
    addu $a1,$a1,$a1
    addu $v0,$zero,$zero #HERE
    addu $t0,$zero,$zero
outer:
    addu $t4,$a0,$t0
    lw $t4,0($t4) # Carrega o próximo valor de T4
    addu $t5,$zero,$zero # zerando o registrador t5, equivalente a Move
    addu $t1,$zero,$zero # zerando o registrador t1, equivalente a Move
inner:
     addu $t3,$a0,$t1
     lw $t3,0($t3)
     bne $t3,$t4,skip
     addiu $t5,$t5,1
skip:
    addiu $t1,$t1,4
    bne $t1,$a1,inner
    slt $t2,$t5,$v0 #HERE
    bne $t2,$zero,next
    addu $v0,$t5,$zero # Here
    addu $v1,$t4,$zero # HERE
 next:
    addiu $t0,$t0,4
    bne $t0,$a1,outer