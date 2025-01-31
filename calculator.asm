#Name: Aram Sodhi
#Name: Andy Cai

# use s0 for runnning total of operations
# use s1 for operand 1
# use s2 for operand 2
# use s3 for selected operation
# use s4 for result of calculation
# use s5 for input to continue or exit
# use s6 for 'n' character

# use t1 for integer corresponding to operation being checked

	.globl main
	.text
main:
	# load 'n' character into s4 register to check while condition
	li s6, 'n'

	# print welcome message
	la a0, welcome_message
	jal printstring
	
	#print operatons available
	la a0, supported_operations_message
	jal printstring
	
loop:
	# print newline character
	#li a0, '\n'
	#jal printchar
	
	# print running total of number of operations
	la a0, number_of_operations_message
	jal printstring
	mv a0, s0
	jal printint
	
	# print prompt to ask for first operand
	la a0, enter_first_number_prompt
	jal printstring
		
	# read integer from the console and save in s1
	jal readint
	mv s1, a0
		
	# print prompt to ask for second operand
	la a0, enter_second_number_prompt
	jal printstring
	
	# read integer from the console and save in s2
	jal readint
	mv s2, a0
		
	# print prompt asking for the operation
	la a0, select_operation_prompt
	jal printstring
		
	# read integer from the console and save in s3
	jal readint
	mv s3, a0
		
		
	# move operands to argument registers
	mv a0, s1
	mv a1, s2
		
# check if operation is addition
if_addition:
	# check subtraction if not addition
	li t1, 1
	bne s3, t1, if_subtraction
			
	# call addition subroutine and store result in s4 register
	jal addnums
	mv s4, a0
			
	# jump to end
	b print_result
			
if_subtraction:
	# check multiplication if not subtraction
	li t1, 2
	bne s3, t1, if_multiplication
			
	# call subtraction subroutine and store result in s4 register
	jal subnums
	mv s4, a0
			
	b print_result
			
if_multiplication:
	# check division if not multiplication
	li t1, 3
	bne s3, t1, if_division
			
	# call multiplication subroutine and store result in s4 register
	jal multnums
	mv s4, a0
			
	b print_result
		
if_division:
	# check and if not division
	li t1, 4
	bne s3, t1, if_and
			
	# call division subroutine and store result in s4 register
	jal divnums
	mv s4, a0
			
	b print_result
			
if_and:
	# check or if not and
	li t1, 5
	bne s3, t1, if_or
			
	# call and subroutine and store result in s4 register
	jal andnums
	mv s4, a0
			
	b print_result
			
if_or:
	# check xor if not or
	li t1, 6
	bne s3, t1, if_xor
			
	# call or subroutine and store result in s4 register
	jal ornums
	mv s4, a0
			
	b print_result
			
if_xor:
	# check lshift if not xor
	li t1, 7
	bne s3, t1, if_lshift
			
	# call xor subroutine and store result in s4 register
	jal xornums
	mv s4, a0
			
	b print_result
			
if_lshift:
	# check rshift if not lshift
	li t1, 8
	bne s3, t1, if_rshift
			
	# call left shift subroutine and store result in s4 register
	jal lshiftnums
	mv s4, a0
			
	b print_result
			
if_rshift:
	# invalid operation if not rshift
	li t1, 9
	bne s3, t1, invalid_operation
			
	# call right shift subroutine and store result in s4 register
	jal rshiftnums
	mv s4, a0
			
	b print_result
			
invalid_operation:
	# print invalid operation message
	la a0, invalid_operation_message
	jal printstring
			
	b if_end
			
print_result:
	# print result of operation
	la a0, result_message
	jal printstring
	mv a0, s4
	jal printint

	b if_end
			
if_end:
	# increment number of operations by 1
	addi s0, s0, 1
		
	# print message to prompt user to continue
	la a0, continue_prompt
	jal printstring
			
	# read character from console and store result in s5
	jal readchar
	mv s5, a0
			
	# print newline character
	li a0, '\n'
	jal printchar
			
	bne s5, s6, loop
			
exit_program:
	# print total number of operations performed
	la a0, number_of_operations_message
	jal printstring
	mv a0, s0
	jal printint
	
	# print exit message
	la a0, exit_message
	jal printstring
		
	# execute exit subroutine
	jal exit0

.data
	welcome_message:   .string "Welcome to the Calculator program.\n"
	supported_operations_message:   .string "Operations - 1:add 2:subtract 3:multiply 4:divide 5:and 6:or 7:xor 8:lshift 9:rshift \n"
	number_of_operations_message: .string "\nNumber of operations performed: "
	enter_first_number_prompt:  .string "\nEnter a number: "
	enter_second_number_prompt: .string "Enter a second number: "
	select_operation_prompt:   .string "Select operation: "
	result_message:      .string "Result: "
	invalid_operation_message: .string "Result: Invalid Operation"
	continue_prompt:     .string "\nContinue (y/n)?: "
	exit_message: .string "\nExiting"