
welcome:   .string "Welcome to the Calculator program."
operand:   .string "Operations - 1:add 2:subtract 3:multiply 4:divide 5:and 6:or 7:xor 8:lshift 9:rshift \n"
num_of_ops: .string "Number of operations performed: "
ent_num:  .string "Enter number: "
ent_num2: .string "Enter second number: "
select:   .string "Select operation: "
res:      .string "Result: "
cont:     .string "Continue (y/n)?:  \n"


main:

#print welcome message
li a0, welcome  #load welcome message into a0
li a7, 4  #asm print
ecall  #system call

#print operatons available
li a0, operand  #load operations message into a0
li a7, 4  #asm print
ecall  #system call



