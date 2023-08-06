## Lab 03
## Exercicio: 2
## Nome: Joao Pedro Schmidt Cordeiro
## Matricula: 22100628
.data
	data: .space 2048
.text
main:
	li $s0, 0	## row = 0
	li $s1, 0	## column = 0
	li $s2, -1	## value = 0
	la $s3, data	## data[0] address
	li $s4, 16	## x = 16

loop_for_column:
	slti $t1, $s1, 16
	beq $t1, 0, end_loop_for_column
		
loop_for_row:
	slti $t0, $s0, 16
	beq $t0, 0, end_loop_for_row
	
	## data[(row * 16 + column) * 4] = value++
	mul $t1, $s0, $s4	# row * 16
	add $t1, $t1, $s1	# (row * 16) + column
	mul $t1, $t1, 4		# ((row * 16) + column) * 4
	add $t1, $t1, $s3	# data[row * 16 + column]
	addi $s2, $s2, 1	# value++
	sw $s2, 0($t1)		# data[row * 16 + column] = value++
	

	addi $s0, $s0, 1
	j loop_for_row
end_loop_for_row:

	li $s0, 0	## row = 0
	addi $s1, $s1, 1
	j loop_for_column
end_loop_for_column: