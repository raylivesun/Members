#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_LENGTH 1000

int main() {
    char input[MAX_LENGTH];
    int length, i, j;

    printf("Enter a string: ");
    fgets(input, MAX_LENGTH, stdin);

    length = strlen(input) - 1; // Remove the trailing newline character

    // Reverse the string
    for (i = 0, j = length - 1; i < j; i++, j--) {
        char temp = input[i];
        input[i] = input[j];
        input[j] = temp;
    }

    printf("Reversed string: %s", input);

    return 0;
}
