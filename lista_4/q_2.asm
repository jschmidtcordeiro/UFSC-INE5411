## Lista 4
## Exercicio: 2
## Nome: Joao Pedro Schmidt Cordeiro
## Matricula: 22100628

.data
	A: .word 5
	B: .word 10
	val: .space 4
.text
main:
	la $s0, A
	la $s1, B
	la $s2, val
	
	lw $t0, 0($s0)
	lw $t1, 0($s1)
	
	# Set arguments
	add $a0, $t0, $zero
	add $a1, $t1, $zero
	
	jal Calcula	# Call the function
	sw $v0, 0($s2)
			
	j End
Calcula:
	mul $t2, $a0, $a1
	
	move $v0, $t2
	jr $ra
	
End: