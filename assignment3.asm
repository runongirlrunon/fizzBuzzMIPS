# created 2.23.16 by lindsey anne. 
# all rights reserved, or... whatever.

# i 	$s0
# max	$s1

	.data

fizz:	.asciiz "Fizz"
buzz:	.asciiz "Buzz"
endl:	.asciiz "\n"

	.text
	li	$s0,1						# i = 1
	li	$s1,100					# max = 100

if1:	rem	$t0,$s0,3		# if (i%3 == 0)
	bnez	$t0,if2				#  {cout << "Fizz";}
	li	$v0,4						#
	la	$a0,fizz				#
		syscall						#

if2:	rem	$t1,$s0,5		# if (i%5 == 0)
	bnez	$t1,if3				#   {cout << "Buzz";}
	li	$v0,4						#
	la	$a0,buzz				#
		syscall						#

if3:	bnez	$t0,if4		# if (i%3 == 0)
	j	end								#   {GOTO end;}

if4:	bnez	$t1,if5		# if (i%5 == 0)
	j	end								#   {GOTO end;}

if5:	li	$v0,1				# else
	move	$a0,$s0				#   {cout << i;}
	syscall

end:	li	$v0,4				# cout << endl;
	la	$a0,endl				#
		syscall						#
	j	inc								# GOTO inc

inc:	addi	$s0,$s0,1	# i++
	ble	$s0,$s1,if1			# if (i<=max) GOTO if1

	li	$v0,10					# terminate program
		syscall						#
