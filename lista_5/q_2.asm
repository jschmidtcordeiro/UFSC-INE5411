## Lista 5
## Exercicio: 2
## Nome: Joao Pedro Schmidt Cordeiro
## Matricula: 22100628

.data
	ENTRADA: .byte 1 2 -2 -3 -4
.text
main: 
	la	$s2, ENTRADA
	lb 	$t0, 2($s2)	# No registrador essa informacao eh interpretada com o sinal, e eh extendido para 4 bytes
	lbu	$t1, 3($s2)	# O sinxal nao eh interpretado, desse modo continua com a quantidade de bytes que estava anteriormente (1 byte)
loop:
	j	loop
	