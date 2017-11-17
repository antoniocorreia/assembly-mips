.data
	base: .asciiz "teste1"
	count: .asciiz "teeste"
.text
main:

	li $v0, 4
	la $a0, count
	syscall
	
	li $v0, 4
	move $a0, $zero
	syscall