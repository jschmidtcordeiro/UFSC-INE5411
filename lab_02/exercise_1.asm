## Lab: 2
## Exercicio: 1
## Nome: Joao Pedro Schmidt Cordeiro
## Matricula: 22100628

.data
	A: 	.word 1,2,3,0,1,4,0,0,1
	B: 	.word 1,-2,5,0,1,-4,0,0,1
	C:	.space 36
    	_i: 	.word 3
	_j: 	.word 3

.text
main:
	# Load all variable adresses
	la	$s0, A
	la	$s1, B
	la	$s2, C
	
    	add $s3, $zero, $zero
    	
   	lw $s5, _i
    	lw $s6, _j
    	
Loop_i:	
	add $s4, $zero, $zero	# Clear column count
Loop_j:	
	add $t4, $zero, $zero	# Clear sum variable

	lw $t0, 0($s0)	# Load A
	lw $t1, 0($s1)	# Load B
	mul $t3, $t0, $t1
	add $t4, $t4, $t3
	
	lw $t0, 4($s0)	# Load A
	lw $t1, 12($s1)	# Load B
	mul $t3, $t0, $t1
	add $t4, $t4, $t3
	
	lw $t0, 8($s0)	# Load A
	lw $t1, 24($s1)	# Load B
	mul $t3, $t0, $t1
	add $t4, $t4, $t3
	
	sw $t4, 0($s2)		# Store C element
	addi $s2, $s2, 4	# Change the C address for the next loop store in the right position
 

	addi $s1, $s1, 4 # Go to next column in B

	addi $s4, $s4, 1
	bne $s6, $s4, Loop_j 	# End of Loop_j
	
	
	
	subi $s1, $s1, 12	# Reset column address to first column
	addi $s0, $s0, 12	# Go to next line in A

	addi $s3, $s3, 1
	bne $s5, $s3, Loop_i	# End of Loop_i
	
