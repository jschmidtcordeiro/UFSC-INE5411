.data

.text
main:
    	li $s0, 0x10010020	# Load address of the vector

	# Index
	li $s4, 0
	
    # v[0] = 1;
    add $t1, $s4, $s4
	add $t1, $t1, $t1
	add $t1, $t1, $s0
	
    li  $t0, 1
    sw  $t0, 0($t1)
    
    # i = i + 1
	addi $s4, $s4, 1

    # v[1] = 3;
    add $t1, $s4, $s4
	add $t1, $t1, $t1
	add $t1, $t1, $s0
	
    li  $t0, 3
    sw  $t0, 0($t1)
    
    # i = i + 1
	addi $s4, $s4, 1

    # v[2] = 2;
    add $t1, $s4, $s4
	add $t1, $t1, $t1
	add $t1, $t1, $s0
	
    li  $t0, 2
    sw  $t0, 0($t1)
    
    # i = i + 1
	addi $s4, $s4, 1

    # v[3] = 1;
    add $t1, $s4, $s4
	add $t1, $t1, $t1
	add $t1, $t1, $s0
	
    li  $t0, 1
    sw  $t0, 0($t1)
    
    # i = i + 1
	addi $s4, $s4, 1

    # v[4] = 4;
    add $t1, $s4, $s4
	add $t1, $t1, $t1
	add $t1, $t1, $s0
	
    li  $t0, 4
    sw  $t0, 0($t1)
    
    # i = i + 1
	addi $s4, $s4, 1

    # v[5] = 5;
    add $t1, $s4, $s4
	add $t1, $t1, $t1
	add $t1, $t1, $s0
	
    li  $t0, 5
    sw  $t0, 0($t1)
    
    # i = i + 1
	addi $s4, $s4, 1
