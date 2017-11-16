.data  
arquivoentrada: .asciiz "string.in"     
buffer: .space 1024
newline: .asciiz "\n"
menorpalavra: .word
.text

main:
	jal abrirArquivo
	jal imprimebuffer
	la $a0, buffer
	lb $t2,newline
	jal lerpalavras
	jr $ra


abrirArquivo:
	li   $v0, 13       # system call for open file
	la   $a0, arquivoentrada      # input file name
	li   $a1, 0        # flag for reading
	li   $a2, 0        # mode is ignored
	syscall            # open a file 
	move $s0, $v0      # save the file descriptor 

# reading from file just opened
	
	li   $v0, 14       # system call for reading from file
	move $a0, $s0      # file descriptor 
	la   $a1, buffer   # address of buffer from which to read
	li   $a2,  1024  # hardcoded buffer length
	syscall            # read from file
	jr $ra

imprimebuffer:	
	li $v0, 4
	la $a0, buffer
	syscall
	jr $ra
	
lerpalavras:
	addi $t0, $zero, 0 #zerando o contador, $t0 guarda o tamanho da string;
    	loop: 
            lb $t1, 0($a0) # carrega o proximo byte dentro de t2;
            beqz $t1, fimarquivo # se $t1 for 0 (fim do arquivo) pula pra saida;
            beq $t1, $t2, fimpalavra #se t1 for \n nova palavra
            addi $a0, $a0, 1 # incrementa o pointeiro da string;
            addi $t0, $t0, 1 # incrementa o contador;
            j loop 
    	fimpalavra:
    	#salva tamanho da string e posicao
            add $a1, $t0, $zero #transfere para $a1 o tamanho da string ($t0)
            addi $a0, $a0, 1
  	    j lerpalavras
	fimarquivo:
	    jr $ra  	    
	    
# Close the file 

	li   $v0, 10       # system call for close file
	syscall            # close file
	jr $ra
