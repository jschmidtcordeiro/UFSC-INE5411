## Lista 4
## Exercicio: 3
## Nome: Joao Pedro Schmidt Cordeiro
## Matricula: 22100628
.data
	frase_base: .ascii "Digite o valor da base:"
	.align 2
	frase_expoente: .ascii "Digite o valor do expoente: "
	.align 2
.text
main:
	## Get values from keyboard input
	li $v0, 4
	la $a0, frase_base
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0	# Store base value
	
	## Get values from keyboard input
	li $v0, 4
	la $a0, frase_expoente
	syscall
	
	li $v0, 5
	syscall
	
	move $t1, $v0	# Store exponent value
	
	## Carrega os argumentos
	add $a0, $t0, $zero
	add $a1, $t1, $zero
	
	jal pow	# Chama a funcao
	
	move $t0, $v0	# Salva retorno da funcao
	li $v0, 1	# Carrega operacao de escrever na tela
	add $a0, $t0, $zero	# Carrega com o argumento, resultado da funcao
	syscall
	
	j End

pow:
	# $t0 = base
	# $t1 = expoente
	li $t2, 1	# int res = 1
	li $t3, 0	# int i = 0
for_loop:
	slt $t4, $t3, $t1	# If i < expoente
	beq $t4, $zero, end_loop
	
	mul $t2, $t2, $t0
	
	addi $t3, $t3, 1
	j for_loop
end_loop:
	add $v0, $t2, $zero

	jr $ra	
	
End: