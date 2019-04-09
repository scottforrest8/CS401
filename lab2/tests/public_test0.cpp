

#include <iostream>

#include "../Finally.h"


int count = 6;


void finalizer()
{
    count++;
}


int main()
{
    {
        Finally fin(&finalizer);
    }

    // At this point the finalizer function should have been invoked
    if (count != 7)
    {
        std::cout << "FAIL 0" << std::endl;
        return 1;
    }
    else
    {
        std::cout << "PASS 0" << std::endl;
        return 0;
    }

    
}


