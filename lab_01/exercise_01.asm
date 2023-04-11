## Lab: 1
## Exercicio: 1
## Nome: Joao Pedro Schmidt Cordeiro
## Matricula: 22100628

.data
	A: .word 25
	B: .word 10
	C: .word 90
	D: .word 15
	E: .word 40
		
.text
main:
	# Load all variable adresses
	la	$s0, A
	la	$s1, B
	la	$s2, C
	la	$s3, D
	la	$s4, E
	
	lw	$t0, 0($s1)
	addi	$t1, $t0, 35
	
	lw	$t0, 0($s4)
	sub	$t2, $t0, $t1
	
	lw	$t0, 0($s3)
	add	$t3, $t2, $t0
	sw	$t3, 0($s2)
