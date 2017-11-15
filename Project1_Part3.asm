.data

ARRAY_SPACE:		.word	2,3,4,5,-1 # 3 even,
EVEN_NUMBER:		.word	0
ODD_NUMBER:		.word	0
TOTAL:			.word	0

		.text

		#Initialize Index (OFFset)
		addi	$t0,	$zero,	0
		addi	$s0,	$zero,	0
		addi	$s1,	$zero,	0
		li	$t2, -1

		#Access Index 0
TOP:
		lw	$t1,	ARRAY_SPACE($t0)
		beq	$t2,	$t1, END
		andi	$t1,	$t1,	1       #Put LSB of number on T1
		bgtz	$t1,	THEN_ODD 	#IF 1 then, it shoudl be odd number
		add	$s0,	$s0,	1	#Else t1 is 0, so it should be an even number
		j	LOOP


THEN_ODD:
		add	$s1,	$s1,	1
		j	LOOP

END:
		add	$s2,	$s1,	$s0	# Get total of even and odd numbers
		sw	$s0, EVEN_NUMBER
		sw	$s1, ODD_NUMBER
		sw	$s2, TOTAL

		li	$v0, 10
		syscall

LOOP:	addi	$t0,	$t0,	4
	j	TOP
