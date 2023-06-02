## Lista 5
## Exercicio: 7
## Nome: Joao Pedro Schmidt Cordeiro
## Matricula: 22100628
.data
	frase_1: .ascii "Digite 0 ou 1: "
	.align 2
	espaco: .space 32
	.align 2
	frase_2: .ascii "Digite o valor do bit a ser trocado: "
	.align 2

.text
main:
	li $s0, 0x10010020	## Input address
main_while:
	## Adquire os inputs
	li $v0, 4
	la $a0, frase_1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0	## Ligado ou desligado
	
	li $v0, 4
	la $a0, frase_2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0	## Numero do bit
	##########
	
	li $t2, 0	## Contador
	li $s4, 1	## Mask
	lw $t3, 0($s0)	## Referencia dos dados
	
while:	beq $t2, $t1, end_while
	sll $s4, $s4, 1
	
	
	addi $t2, $t2, 1
	j while
end_while: 
	
if:	bne $t0, 1, else_if	## Change to 1
	or $t3, $t3, $s4

else_if:bne $t0, 0, end_if
	not $s4, $s4
	and $t3, $t3, $s4	## Change to 0

end_if:
	
	sw $t3, 0($s0)
	



	## Print sequencia de bits

	j main_while
end_main_while: