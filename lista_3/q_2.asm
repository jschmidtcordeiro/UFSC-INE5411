## Lista 3
## Exercicio: 2
## Nome: Joao Pedro Schmidt Cordeiro
## Matricula: 22100628

.data
	_i: 	.word 10
	
.text
main:
    add $t0, $zero, $zero
    lw  $t1, _i
    lw  $t2, _i
    li  $t4, 5

Loop:
        add $t0, $t0, $t1
        addi $t2, $t2, 1
        bne $t4, $t2, Loop