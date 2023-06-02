## Lista 3
## Exercicio: 3
## Nome: Joao Pedro Schmidt Cordeiro
## Matricula: 22100628

.data

.text
main:
    li $s0, 0x10010020	# Load address of the vector

    # v[0] = 1;
    li  $t0, 1
    sw  $t0, 0($s0)

    # v[1] = 3;
    li  $t0, 3
    sw  $t0, 4($s0)

    # v[2] = 2;
    li  $t0, 2
    sw  $t0, 8($s0)

    # v[3] = 1;
    li  $t0, 1
    sw  $t0, 12($s0)

    # v[4] = 4;
    li  $t0, 4
    sw  $t0, 16($s0)

    # v[5] = 5;
    li  $t0, 5
    sw  $t0, 20($s0)
