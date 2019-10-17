 #
 # 	Coded By: 	Woolbright Josh
 # 	Date: 		10/16/2019
 # 	Description:
 # 			This program calculates the fibbonaci
 #			sequence of 12.
 #

	.data
 name: 	.asciiz "Fibonacci by J. Woolbright\n" 
 newlin:.asciiz "\n"

	.text
 main:	
	la	$a0, name
	li	$v0, 4
	syscall

	la	$a0, newlin
	li	$v0, 4
	syscall

	li	$a0, 0		#print first fib value of 0
	li	$v0, 1
	syscall

	la	$a0, newlin
	li	$v0, 4
	syscall

	li	$a0, 1		#print second fib value of 1
	li	$v0, 1
	syscall

	la	$a0, newlin
	li	$v0, 4
	syscall

	li	$t0, 0		#store intial fib values in t0
	li	$t1, 1		#and t1
	li	$t3, 1		#t3 used as a counter to exit loop

 loop:
	jal	fib

	move	$a0, $t2	#print fib sum
	li	$v0, 1
	syscall

	la	$a0, newlin
	li	$v0, 4
	syscall

	move	$t2, $0		#clear sum register

	beq	$t3, 12, end	#if n=12, then end program

 fib:
	add	$t2, $t1, $t0	#add previous 2 fib sums to t2
	add	$t4, $t1, $t0	#t4 is used to move the sum to t1
	addi	$t3, 1		#increment counter

	move	$t0, $t1	#shift register values for next
	move	$t1, $t4	#call
	move	$t4, $0	

	jr	$ra

 end:
	li	$v0, 10
	syscall
