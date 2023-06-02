## Lista 3
## Exercicio: 1
## Nome: Joao Pedro Schmidt Cordeiro
## Matricula: 22100628

.data
	A: 	.word 10
	B: 	.word 15
	C:	.word 20
	D:	.word 25
	E:	.word 30
	F:	.word 35
	G:	.word 0, 0, 0, 0
	H:	.word 0, 0, 0, 0
	
.text
main:
	la	$s6, G
	la	$s7, H
	
	lw	$s0, A
	lw	$s1, B
	lw	$s2, C
	lw	$s3, D
	lw	$s4, E
	lw	$s5, F
	
	
	# a) G[0] = (A – (B + C) + F);
	add	$t0, $s1, $s2	# B + C
	sub $t1, $s5, $t0	# F - (B + C)
	add	$t0, $t1, $s0	# (F - (B + C)) + A
	sw	$t0, 0($s6)		# Store in G[0]

	# b) G[1] = E – (A – B) * (B – C);
	sub	$t0, $s0, $s1	# A - B
	sub	$t1, $s1, $s2	# B - C
	mul $t2, $t0, $t1	# (A - B) * (B - C)
	sub	$t0, $s4, $t2	# E - ((A - B) * (B - C))
	sw	$t0, 4($s6)		# Store in G[1]

	# c) G[2] = G[1] – C;
	lw	$t0, 4($s6)		# Load G[1]
	sub $t1, $t0, $s2	# G[1] – C
	sw	$t1, 8($s6)		# Store in G[2]

	# d) G[3] = G[2] + G[0];
	lw	$t0, 8($s6)		# Load G[2]
	lw	$t1, 0($s6)		# Load G[0]
	add $t3, $t0, $t1	# G[2] + G[0]
	sw	$t3, 12($s6)	# Store in G[3]

	# e) H[0] = B – C;
	sub $t1, $s1, $s2	# B - C
	sw	$t1, 0($s7)		# Store in H[0]

	# f) H[1] = A + C;
	add $t1, $s0, $s2	# A + C
	sw	$t1, 4($s7)		# Store in H[1]

	# g) H[2] = B – C + G[3];
	sub $t1, $s1, $s2	# B - C
	lw	$t2, 12($s6)	# Load G[3]
	add $t3, $t1, $t2	# (B - C) + G[3]
	sw	$t3, 8($s7)		# Store in H[2]

	# h) H[3] = B – G[0] + D;
	lw	$t1, 0($s6)		# Load G[0]
	sub $t2, $s1, $t1	# B – G[0]
	add $t3, $t2, $s3	# (B – G[0]) + D
	sw	$t3, 12($s7)
