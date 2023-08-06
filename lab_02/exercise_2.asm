## Lab: 2
## Exercicio: 2
## Nome: Joao Pedro Schmidt Cordeiro
## Matricula: 22100628

.data
	A: 	.word 1,2,3,0,1,4,0,0,1
	B: 	.word 1,-2,5,0,1,-4,0,0,1
	C:	.space 36
	fout:   .asciiz "c.txt"      
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
	

	# Write final value in file
	addi $t4, $t4, 48
	sb $t4, 0($s2)
	addi $s2, $s2, 1
	add	$a0, $zero, $t4	# Valor a ser escrito
	li 	$v0, 1  	# Comando.
	syscall

	li $t4, ' '
	sb $t4, 0($s2)
	addi $s2, $s2, 1
	li 	$a0, ' '	# Valor a ser escrito
	li	$v0, 11		# Comando
	syscall 

	addi $s1, $s1, 4 # Go to next column in B

	addi $s4, $s4, 1
	bne $s6, $s4, Loop_j 	# End of Loop_j
	
	# Line break
	li $t4, 10
	sb $t4, 0($s2)
	addi $s2, $s2, 1
	li	$a0, '\n'	
	li	$v0, 11		
	syscall
	
	subi $s1, $s1, 12	# Reset column address to first column
	addi $s0, $s0, 12	# Go to next line in A

	addi $s3, $s3, 1
	bne $s5, $s3, Loop_i	# End of Loop_i
	
	# Open (for writing) a file that does not exist
  	li   $v0, 13       	# system call for open file
  	la   $a0, fout     	# output file name
  	li   $a1, 1        	# Open for writing (flags are 0: read, 1: write)
  	li   $a2, 0        	# mode is ignored
  	syscall            	# open a file (file descriptor returned in $v0)
  	move $s7, $v0      	# save the file descriptor
	
	# Write to file just opened
  	li   $v0, 15       	# system call for write to file
  	move $a0, $s7      	# file descriptor 
  	la   $a1, C  		# address of buffer from which to write
  	li   $a2, 36       	# hardcoded buffer length
  	syscall            	# write to file
  	
  	# Close the file 
  	li   $v0, 16       	# system call for close file
  	move $a0, $s7      	# file descriptor to close
  	syscall            	# close file	
	
