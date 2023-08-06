## Lab 05
## Exercicio: 1
## Nome: Joao Pedro Schmidt Cordeiro
## Matricula: 22100628
.data
	frase_1: .ascii "Digite o tamanho das matrizes: "
	.align 2
.text
main:

	## Recebe via teclado o numero a ser calculado o fatorial
	li $v0, 4
	la $a0, frase_1
	syscall
	li $v0, 5
	syscall
	
	move $t6, $v0	# Salva MAX
	
	## Reservar espaco na memoria para as duas matrizes:
	## MAX * MAX * float = .space
	li $t1, 4
	mul $t7, $t6, $t6
	mflo $t7
	mul $t7, $t7, $t1
	mflo $t7
	
	## Alocar um espaco para A
	li $s6, 0x10010000	## Input address
	
	## Alocar um espaco para B
	add $s7, $s6, $t7
	
	
	###-----------------###
	### Preenchendo Matriz
	###-----------------###
	
loop_for_row_1:
	slt $t0, $s0, $t6 		## Set less then MAX  ## loop_for_row_1:
	beq $t0, 0, end_loop_for_row_1
		
loop_for_column_1:
	slt $t1, $s1, $t6		## Set less then MAX  # loop_for_column_1:
	beq $t1, 0, end_loop_for_column_1
	
	#########################################
	### A[i,j]
	## ((i * MAX) + j) * 4
	mul $t2, $s0, $t6
	add $t2, $t2, $s1
	li $t4, 4
	mul $t2, $t2, $t4

	## Soma ao endereco original de A
	add $t2, $t2, $s6
	
	#########################################
	### B[j, i]
	## ((i * MAX) + j) * 4
	mul $t3, $s0, $t6	# (i * MAX)
	add $t3, $t3, $s1	# (i * MAX) + j
	li $t4, 4	# $t4 = 8
	mul $t3, $t3, $t4	# ((i * MAX) + j) * 8

	## Soma ao endereco original de B
	add $t3, $t3, $s7
	
	#########################################
	
	mtc1 $s0, $f0		## Move i to Coproc 1
	cvt.s.w $f0, $f0	## Convert i from word to float
	
	mtc1 $s1, $f1		## Move j to Coproc 1
	cvt.s.w $f1, $f1	## Convert j from word to float
	
	add.s $f0, $f0, $f1 	## i + j
	swc1 $f0, 0($t2)	## Store em A[i,j]
	swc1 $f0, 0($t3)	## Store em B[i,j]
	

	addi $s1, $s1, 1		## j++
	j loop_for_column_1
end_loop_for_column_1:

	li $s1, 0			## column = 0
	addi $s0, $s0, 1		## i++
	j loop_for_row_1
end_loop_for_row_1:
	
	
	
	###-----------------###
	### Matriz
	###-----------------###
	
	### Zerar i e j
	add $s0, $zero, $zero
	add $s1, $zero, $zero
	
	
loop_for_row:
	slt $t0, $s0, $t6 		## Set less then MAX Second part  ## loop_for_row:
	beq $t0, 0, end_loop_for_row
		
loop_for_column:
	slt $t1, $s1, $t6		## Set less then MAX	## loop_for_column:
	beq $t1, 0, end_loop_for_column
	
	#########################################
	### A[i,j]
	## ((i * MAX) + j) * 8
	mul $t2, $s0, $t6
	add $t2, $t2, $s1
	li $t4, 4
	mul $t2, $t2, $t4

	## Soma ao endereco original de A
	add $t2, $t2, $s6
	
	lwc1 $f0, 0($t2)	## A[i,j]
	
	#########################################
	### B[j, i]
	## ((j * MAX) + i) * 8
	mul $t3, $s1, $t6	# (j * MAX)
	add $t3, $t3, $s0	# (j * MAX) + i
	li $t4, 4		# $t4 = 8
	mul $t3, $t3, $t4	# ((j * MAX) + i) * 8

	## Soma ao endereco original de B
	add $t3, $t3, $s7
	
	lwc1 $f1, 0($t3)	## B[j,i]
	#########################################
	
	add.s $f0, $f0, $f1 	## A[i,j] + B[j,i]
	swc1 $f0, 0($t2)	## Store em A[i,j]
	

	addi $s1, $s1, 1		## j++
	j loop_for_column
end_loop_for_column:

	li $s1, 0			## column = 0
	addi $s0, $s0, 1		## i++
	j loop_for_row
end_loop_for_row:
