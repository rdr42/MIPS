#Project 1, Assignment 1

#Data Space
		.data
A:	.word 2
B:	.word -9
C:	.word 256
D:	.word -1
#Text Space
		.text
		lw $s0, A
		lw $s1, B
		lw $s2, C
		lw $s3, D

#Main Space
		.globl my_main
my_main:

		sll $t0, $s0, 1
		sll $t1, $s0, 3
		add $t0, $t0, $t1
		sw  $t0, A

		sra $t0, $s1, 3
		sw  $t0, B

		srl $t0, $s2, 6
		sw  $t0, C

		rol $t0, $s3, 4
		sw  $t0, D
