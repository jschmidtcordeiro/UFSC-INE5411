## Lab: 1
## Exercicio: 2
## Nome: Joao Pedro Schmidt Cordeiro
## Matricula: 22100628

.data
	A: .word 0
	B: .word 0
	C: .word 0
	D: .word 0
	E: .word 0
	FRASE_B: .asciiz "Digite o valor de B: "
	FRASE_E: .asciiz "Digite o valor de E: "
	FRASE_D: .asciiz "Digite o valor de D: "
	FRASE_1: .asciiz "O resultado final eh: "
		
.text
main:
	## Load all variable adresses
	la	$s0, A
	la	$s1, B
	la	$s2, C
	la	$s3, D
	la	$s4, E
	
	## Primeira logica de ler o input
	li	$v0, 4			# Comando.
	la	$a0, FRASE_B		# Carrega string (endereco).
	syscall 
	li	$v0, 5	      		# Comando para ler inteiro.
	syscall
	move    $t0, $v0         	# Resultado salvo em $t0. 
	
	addi	$t1, $t0, 35		# a = b + 35;
	
	
	## Primeira logica de ler o input
	li	$v0, 4			# Comando.
	la	$a0, FRASE_E		# Carrega string (endereco).
	syscall 
	li	$v0, 5	      		# Comando para ler inteiro.
	syscall
	move    $t0, $v0         	# Resultado salvo em $t0. 
	
	sub	$t2, $t0, $t1		# $t2 = e - a
	
	## Primeira logica de ler o input
	li	$v0, 4			# Comando.
	la	$a0, FRASE_D		# Carrega string (endereco).
	syscall 
	li	$v0, 5	      		# Comando para ler inteiro.
	syscall
	move    $t0, $v0         	# Resultado salvo em $t0. 

	add	$t3, $t2, $t0		# c = d + $t2
	sw	$t3, 0($s2)

	## Printando o resultado final
	li	$v0, 4			# Comando.
	la	$a0, FRASE_1		# Carrega string (endereco).	
	syscall 
	
	lw	$t1, 0($s0)
	li	$v0, 1			# Comando.
	move	$a0, $t3		# Carrega valor.
	syscall 