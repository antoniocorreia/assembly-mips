.data  
fin: .asciiz "file.txt"      # filename for input
buffer: .space 1024
message: .asciiz "Hello,"

.text

main:
	jal openFile
	jr $ra

################################################ fileRead:

# Open file for reading
openFile:
	li   $v0, 13       # system call for open file
	la   $a0, fin      # input file name
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
	
	li $v0, 4
	la $a0, buffer
	syscall

# Close the file 

	li   $v0, 10       # system call for close file
	syscall            # close file
	jr $ra
