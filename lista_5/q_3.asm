## Lista 5
## Exercicio: 3
## Nome: Joao Pedro Schmidt Cordeiro
## Matricula: 22100628

.data
	frase: .ascii "Digite algo com ate 7 digitos: "
	.align 2
	input_space: .space 256
	.align 2
.text
main:
	li $v0, 4
	la $a0, frase
	syscall

	la $s0, input_space	# Move o endereco de memoria de dados para $s0
		
	# Recebe o input e coloca na memoria alocada anteriormente
	move $a0, $s0		# Passa como argumento o endereco de memoria alocado anteriormente
	li $a1, 256		# Passa o valor maximo de bits para a leitura
	li $v0, 8		# Operacao de leitura de input do teclado
	syscall

	
	