#include <stdio.h>

int fib_iter(int result, int counter);
int fib(int n);

int main(int argc, char *argv[])
{
    printf ("%d\n", fib(6));
    
    return 0;
}

int fib_iter(int result, int counter)
{
    if (counter > n)
        return result;
    else
        fib((result * counter), (counter++));
}

int fib(int n)
{
    fib_iter(1, 1);
}
