## Lista 4
## Exercicio: 5
## Nome: Joao Pedro Schmidt Cordeiro
## Matricula: 22100628
.data
	frase_1: .ascii "Digite o numero a ser calculado o fatorial: "
	frase_2: .ascii "Esse eh o fatorial: "
.text
main:
	## Recebe via teclado o numero a ser calculado o fatorial
	li $v0, 4
	la $a0, frase_1
	syscall
	li $v0, 5
	syscall
	
	move $s0, $v0	# Salva n
	move $a0, $s0	# Passa n como argumento da funcao
	
	jal fatorial
	
	j end
fatorial:
	addi $sp, $sp, -12
	sw $ra, 0($sp)
	sw $a0, 4($sp)	# n interno
	sw $v0, 8($sp)	# 8($sp) retorno
	
	lw $t0, 4($sp)
	slti $t0, $t0, 1
	beq $t0, $zero, else
	## If (n < 1)
	addi $v0, $zero, 1
	j end_factorial
else:	
	## Else
	lw $t0, 4($sp)
	addi $a0, $t0, -1
	jal fatorial
	
	lw $t0, 4($sp)
	mul $v0, $v0, $t0
	
end_factorial:
	lw $ra, 0($sp)
	addi $sp, $sp, 12
	jr $ra
	
end: