
#include "../Finally.h"

#include <iostream>

int count = 354;


void finalizer()
{
    count = 13;
}


int main()
{
    try
    {
        Finally fin(&finalizer);
        throw 1;
        // Doesn't reach here
        count += 16;
    }
    catch (int ex)
    {
        count++;
    }

    // At this point the finalizer function should have been properly invoked
    if (count != 14)
    {
        std::cout << "FAIL 1" << std::endl;
        return 1;
    }
    else
    {
        std::cout << "PASS 1" << std::endl;
        return 0;
    }
}


