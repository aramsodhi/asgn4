.globl printint, printstring, printchar, readchar, readint, exit0

# assume int to print is in register a0
printint:
	li a7, 1
	ecall
	ret
	
# assume address to string to print is in register a0
printstring:
	li a7, 4
	ecall
	ret
	
# assume char to print is in register a0
printchar:
	li a7, 11
	ecall
	ret
	
# stores input char in register a0
readchar:
	li a7, 12
	ecall
	ret
	
# stores input int in register a0
readint:
	li a7, 5
	ecall
	ret
	
exit0:
	li a7, 10
	ecall
	ret
