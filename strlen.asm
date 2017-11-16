.data
ENTRADA: .asciiz "casa"
.text

main:
	la $a0, ENTRADA
	jal strlen
	jal imprime

strlen:
    addi $t0, $zero, 0 #zerando o contador, $t0 guarda o tamanho da string;
    loop: 
            lb $t1, 0($a0) # carrega o proximo byte dentro de t2;
            beqz $t1, fimloop # se $t2 for 0 (fim da string) pula pra saida;
            addi $a0, $a0, 1 # incrementa o pointeiro da string;
            addi $t0, $t0, 1 # incrementa o contador;
            j loop 
    fimloop:
            add $a1, $t0, $zero #transfere para $a1 o tamanho da string ($t0)
            jr $ra 
            
imprime:
	li $v0, 1
	move $a0, $a1
	syscall
	li   $v0, 10       # system call for close file
	syscall            # close file