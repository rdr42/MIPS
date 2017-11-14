#Project 1, Assignment 2

#Data Space
		.data
LETTER:		.asciiz	"B"
VALID:		.word 0
#Text Space
		.text
		lw $s0, LETTER
		li $s1, 65
		li $s2, 90
		li $s3, 97
		li $s4, 122
		li $s5, 0
		lw $s6, VALID
#Main Space
		.globl my_main
my_main:
		# By negating if(LETTER >= 65 and LETTER <= 90)
		# We have (LETTER < 65 or LETTER > 90)... Which is equivalent to first statement
		# The same theory holds for Case_2

		#If Upper Case, then go to Lower Case
		#Case_1:
		slt $t0, $s0, $s1
		slt  $t1, $s2, $s0
		add $t2, $t0, $t1  # F + F = T, F + T or T + T = F
                blez $t2, TO_LOWER_CASE

		#If Lower Case, the go to Upper Case
		#Case_2:
		slt $t0, $s0, $s3
		slt  $t1, $s4, $s0
		add $t2, $t0, $t1  # F + F = T, F + T or T + T = F
                beq $t2, $s5, TO_UPPER_CASE

                add $t3, $zero, 63 # If none worked, then it must be "?"
       		sw $t3, LETTER
       		li $t0, 0
                sw $t0, VALID
                j END

TO_UPPER_CASE:
sub $t3, $s0, 32
sw $t3, LETTER
li $t0, 1
sw $t0, VALID
j END

TO_LOWER_CASE:
add $t3, $s0, 32
sw $t3, LETTER
li $t0, 1
sw $t0, VALID
j END

END:
li	$v0, 10
syscall
