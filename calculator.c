#include <stdio.h>
#include "operations.h"

int main(void) {
    /* int to track running total of operations performed */
    int num_operations = 0;
    
    /* ints to store numbers the user inputs */
    int operand_1;
    int operand_2;

    /* int to store which operation the user inputs */
    int operation;

    /* int to store the result of a calculation */
    int result;

    /* char to store user input when asked to continue/exit */
    char continue_or_exit;

    /* int to store whether an input is valid or not */
    int invalid_operation = 0;

    /* print welcome message */
    printf("Welcome to the Calculator program.\n");

    /* print supported operations */
    printf("Operations - 1:add 2:subtract 3:multiply 4:divide 5:and 6:or 7:xor 8:lshift 9:rshift\n");

    /* main loop, asks the user to continue after running once */
    do {
        /* reset invalid operation flag to false */
        invalid_operation = 0;

        /* print running total of operations performed */
        printf("\nNumbers of operations performed: %d", num_operations);
        
        /* prompt the user to enter a number and read input */
        printf("\nEnter number: ");
        scanf(" %d", &operand_1);

        /* prompt the user to enter a second number and read input */
        printf("Enter second number: ");
        scanf(" %d", &operand_2);

        /* prompt the user to select operation and read input */
        printf("Select operation: ");
        scanf(" %d", &operation);

        /* check valid operation, otherwise jump to continue, default in switch statemnt */

        /* perform operation and store result */
        /* use functions defined in operations.c */
        switch (operation) {
            case 1:
                result = addnums(operand_1, operand_2);
                break;
            case 2:
                result = subnums(operand_1, operand_2);
                break;
            case 3:
                result = multnums(operand_1, operand_2);
                break;
            case 4:
                result = divnums(operand_1, operand_2);
                break;
            case 5:
                result = andnums(operand_1, operand_2);
                break;
            case 6:
                result = ornums(operand_1, operand_2);
                break;
            case 7:
                result = xornums(operand_1, operand_2);
                break;
            case 8:
                result = lshiftnums(operand_1, operand_2);
                break;
            case 9:
                result = rshiftnums(operand_1, operand_2);
                break;
            default:
                invalid_operation = 1;
                break;
        }

        /* print result if operation is valid, otherwise print invalid operation message */
        if (invalid_operation) {
            printf("Result: Invalid Operation\n");
        } else {
            printf("Result: %d\n", result);
        }

        /* prompt user to continue or exit */
        printf("Continue (y/n)?: ");

        /* read character into variable used for while condition */
        scanf(" %c", &continue_or_exit);

        /* increment number of operatios completed */
        num_operations++;
    } while (continue_or_exit != 'n');

    /* print number of operations performed and exit message */
    printf("\nNumber of operations performed: %d", num_operations);
    printf("\nExiting");

    /* exit */
    return 0;
}
