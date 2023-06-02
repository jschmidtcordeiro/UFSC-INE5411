.data
	A: .space 4
	B: .space 4
	C: .space 4
	f_a: .ascii "Digite valor de A:"
	.align 2
	f_b: .ascii "Digite valor de B:"
	.align 2

.text
main:
	la $s0, A
	la $s1, B
	la $s2, C
	
	## Save input value in A
	li $v0, 4
	la $a0, f_a
	syscall
	li $v0, 5
	syscall
	
	move $t0, $v0
	sw $t0, 0($s0)
	
	## Save input value in B
	li $v0, 4
	la $a0, f_b
	syscall
	li $v0, 5
	syscall
	
	move $t1, $v0
	sw $t1, 0($s1)
	
	#####################
	## -- Exercises -- ##
	#####################
	
	## A ##
	# if (a > b)
	# 	a = a + 1;
	
#	lw $t0, 0($s0) # Load A
#	lw $t1, 0($s1) # Load B
	
#	slt $t3, $t1, $t0	# If B is less then A
#	beq $t3, $zero, End_if
	
#	addi $t0, $t0, 1
#	sw $t0, 0($s0)
	
#End_if:

	## B ##
	# if (a ≥ b)
	# 	b = b + 1;
	
	# lw $t0, 0($s0) # Load A
	# lw $t1, 0($s1) # Load B
	
	# slt $t3, $s1, $s1	# If B is less then A
	# bne $t3, $zero, End_if
	
	# addi $t1, $t1, 1
	# sw $t1, 0($s1)
#End_if: 

	## C ##
	# if (a ≤ b)
	#	a = a + 1;

#	lw $t0, 0($s0) # Load A
#	lw $t1, 0($s1) # Load B	
	
#	slt $t3, $t1, $t0	# If B is less then A
#	bne $t3, $zero, End_if
	
#	addi $t0, $t0, 1
#	sw $t0, 0($s0)
#
#End_if:

	## D ##
	# if (a == b)
	#	b = a;
	
#	lw $t0, 0($s0) # Load A
#	lw $t1, 0($s1) # Load B
	
#	bne $t0, $t1, End_if
	
#	sw $t0, 0($s1)
#End_if:


	## E ##
	# if (a < b)
	#	a = a + 1;
	# else
	#	b = b + 1;;
	
#	lw $t0, 0($s0) # Load A
#	lw $t1, 0($s1) # Load B
	
#	slt $t3, $t0, $t1
#	beq $t3, $zero, Else
	
#	addi $t0, $t0, 1
#	sw $t0, 0($s0)
#	j End_if
#Else:
	
#	addi $t1, $t1, 1
#	sw $t1, 0($s1)
#End_if:

	## F ##
	# a = 0;
 	# b = 0;
 	# c = 5;
 	# while (a < c){
	#	a = a+ 1;
	#	b = b + 2;}
	
#	li $t0, 0
#	li $t1, 0
#	li $t2, 5
#	sw $t0, 0($s0)
#	sw $t1, 0($s1)
#	sw $t2, 0($s2)
	
#While:
#	slt $t3, $t0, $t2
#	beq $t3, $zero, End_while
	
#	addi $t0, $t0, 1
#	sw $t0, 0($s0)
	
#	addi $t1, $t1, 2
#	sw $t1, 0($s1)
	
#	j While
#	
#End_while:

	## G ##
	# a = 1;
 	# b = 2;
 	# c = 5;
 	# for (i = 0; i < 5; i ++){
	#	a = b + 1;
	#	b = b + 3;}
	
#	li $t0, 1
#	li $t1, 2

#	sw $t0, 0($s0)
#	sw $t1, 0($s1)
	
#	li $t2, 0	# i = 0
#For_loop:
#	slti $t3, $t2, 5
#	beq $t3, $zero, End_loop
	
#	addi $t0, $t0, 1
#	sw $t0, 0($s0)
	
#	addi $t1, $t1, 3
#	sw $t1, 0($s1)
	
#	addi $t2, $t2, 1	# i++
#	j For_loop
	
#End_loop:
	
	## H ##
	# c = 0;
	# switch(a){
	#	case 1:
	#		b = c + 1;
	#		break;
	#	case 2:
	#		b = c + 2;
	#		break;
	#	default:
	#		b = c;
	#		break;}
	
#	lw $t0, 0($s0)
#	lw $t1, 0($s1)
#	li $t2, 8
	
#	beq $t0, 1, Case_1
#	beq $t0, 2, Case_2
#	j Default
	
#Case_1:
#	addi $t1, $t2, 1
#	sw $t1, 0($s1)
	
#	j End_switch
#Case_2:
#	addi $t1, $t2, 2
#	sw $t1, 0($s1)
	
#	j End_switch
#Default:
#	sw $t2, 0($s1)

#End_switch:
	