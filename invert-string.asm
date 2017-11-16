.data
string: .asciiz "kid_gumer"

.text

	addi $sp, $sp, -30
	addi $sp, $sp, 15
	la $a0, string
main:
	lb $a1, 0($a0)
	beqz $a1, proc
	addi $a0, $a0, 1
	sb $a1, 0($sp)
	addi $sp, $sp, -1
	j main
	
proc:
	addi $a0, $a0, -10
	addi $sp, $sp, 1
proc2:
	
	lb $a1, 0($sp)
	beqz $a1, fim
	addi $a0, $a0, 1
	sb $a1, 0($a0)
	addi $sp, $sp, 1
	j proc2
fim:
	addi $a0, $a0, 1
	sb $zero, 0($a0)