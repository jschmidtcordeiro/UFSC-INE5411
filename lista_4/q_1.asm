## Lista 4
## Exercicio: 1
## Nome: Joao Pedro Schmidt Cordeiro
## Matricula: 22100628

.data
	F: .space 4
	G: .space 4
	H: .space 4
	I: .space 4
	J: .space 4
	frase_g: .ascii "Digite o valor de G: "
	.align 2
	frase_h: .ascii "Digite o valor de H: "
	.align 2
	frase_i: .ascii "Digite o valor de I: "
	.align 2
	frase_j: .ascii "Digite o valor de J: "
	.align 2
.text
main:
	
	# Print frase
	li $v0, 4
	la $a0, frase_g
	syscall
	
	li $v0, 5
	syscall
	
	move $t0, $v0
	la $s0, G
	sw $t0, 0($s0)
	
	# Print frase
	li $v0, 4
	la $a0, frase_h
	syscall
	
	li $v0, 5
	syscall
	
	move $t1, $v0
	la $s1, H
	sw $t1, 0($s1)
	
	# Print frase
	li $v0, 4
	la $a0, frase_i
	syscall
	
	li $v0, 5
	syscall
	
	move $t2, $v0
	la $s2, I
	sw $t2, 0($s2)
	
	# Print frase
	li $v0, 4
	la $a0, frase_j
	syscall
	
	li $v0, 5
	syscall
	
	move $t3, $v0
	la $s3, H
	sw $t3, 0($s3)

	#################
	## Carrega os argumentos
	add $a0, $t0, $zero
	add $a1, $t1, $zero
	add $a2, $t2, $zero
	add $a3, $t3, $zero
	
	jal Calcula	# $ra <- PC + 4; PC <- Calcula
	j End

Calcula:
	## Realiza o procedimento
	add $t0, $a0, $a1	# (g + h)
	add $t1, $a2, $a3	# (i + j)
	
	sub $v0, $t0, $t1	# (g + h) - (i + j)
	la $t0, F	# Load F address
	sw $v0, 0($t0)	# Store F value in the memory
	
	jr $ra	# Return to the function call
	
End: