## Lista 5
## Exercicio: 6
## Nome: Joao Pedro Schmidt Cordeiro
## Matricula: 22100628

.data
	input: .space 32
	.align 2
	frase: .ascii "Digite uma palavra de ate 7 digitos:"
	.align 2

.text
main:

	li $v0, 4
	la $a0, frase
	syscall
	
	la $s0, input
	
	li $v0, 8
	move $a0, $s0
	li $a1, 32
	syscall
	
	li $s1, 0	## i = 0
	li $s2, 0	## count = 0
while_loop:
	la $t1, input
	add $t1, $t1, $s1
	lb $t0, 0($t1)
	
	beq $t0, 0, end_while
	
if:	bne $t0, 97, end_if
	addi $s2, $s2, 1
	
end_if:
	
	
	addi $s1, $s1, 1
	j while_loop
end_while:
	