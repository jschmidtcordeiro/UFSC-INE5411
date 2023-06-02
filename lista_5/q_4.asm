## Lista 5
## Exercicio: 4
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
	
	la $s0, input_space
	
	li $v0, 8
	move $a0, $s0
	li $a1, 256
	syscall
	
	add $s1, $zero, $zero	# i = 0
	add $s2, $zero, $zero	# count = 0
	li $s4, 8
loop:
	slt $t1, $s1, $s4
	beq $t1, $zero, end_loop
	
	add $t0, $s0, $s1
	lb $t1, 0($t0)
	li $t2, 97
	bne $t1, $t2, if_not
	addi $s2, $s2, 1
if_not:	
	
	addi $s1, $s1, 1
	j loop
end_loop: