# assume int to print is in register a0
printint:
	li a7, 1
	ecall
	
# assume address to string to print is in register a0
printstring:
	li a7, 4
	ecall
	
# assume char to print is in register a0
printchar:
	li a7, 11
	ecall
	
# stores input char in register a0
readchar:
	li a7, 12
	ecall
	
# stores input int in register a0
readint:
	li a7, 5
	ecall
	
exit:
	li a7, 10
	ecall