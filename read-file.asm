.data  
fin: .asciiz "C:\Users\Antonio\Documents\GitHub\assembly-mips\file.txt"      # filename for input
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
	move $s6, $v0      # save the file descriptor 

# reading from file just opened
	
	
	
	li   $v0, 14       # system call for reading from file
	move $a0, $s6      # file descriptor 
	la   $a1, buffer   # address of buffer from which to read
	li   $a2,  1024  # hardcoded buffer length
	syscall            # read from file
	
	la $a0, buffer
	li $v0, 4
	syscall

# Close the file 

	li   $v0, 16       # system call for close file
	move $a0, $s6      # file descriptor to close
	syscall            # close file
	jr $ra