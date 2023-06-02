## Lista 4
## Exercicio: 4
## Nome: Joao Pedro Schmidt Cordeiro
## Matricula: 22100628
.data
	n1: .space 4
	n2: .space 4
	

	frase_resultado: .ascii "O resultado da soma eh:"
	.align 2
	frase_1: .ascii "Digite o valor do primeiro numero: "
	.align 2
	frase_2: .ascii "Digite o valor do segundo numero: "
	.align 2
.text
	# Carrega argumentos para soma
	la $s0, n1 
	la $s1,	n2
main:
	lw $t0, 0($s0)
	lw $t1, 0($s1)
	
	add $a0, $t0, $zero
	add $a1, $t1, $zero
	
	jal soma
	move $t0, $v0
	
	## Printa resultado
	# primeiro a frase
	li $v0, 4
	la $a0, frase_resultado
	syscall	
	# seguido do valor
	li $v0, 1
	move $a0, $t0
	syscall
	
	j end
soma:
	addu $s2, $ra, $zero	# Armazena o PC que aponta para o retorno da funcao soma

	jal leitura
	## Le o n1 e n2 armazenados na memoria
	lw $t0, 0($s0)
	lw $t1, 0($s1)
	
	add $t0, $t0, $t1 # Soma n1 e n2
	move $v0, $t0 # Salva o valor de retorno da soma anterior  

	jr $s2	# Retorna para a chamada da funcao soma

leitura:
	# Printa a primeira chamada
	li $v0, 4
	la $a0, frase_1
	syscall
	# Recebe e guarda n1
	li $v0, 5
	syscall
	move $t0, $v0
	
	# Printa a segunda chamada
	li $v0, 4
	la $a0, frase_2
	syscall
	# Recebe e guarda n2
	li $v0, 5
	syscall
	move $t1, $v0
	
	# Salva n1 e n2 na memoria
	sw $t0, 0($s0)
	sw $t1, 0($s1)

	jr $ra	# Retorna para a chamada da funcao leitura
end: