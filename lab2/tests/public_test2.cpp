
#include "../Finally.h"
#include <iostream>

int count = 666;


void finalizer()
{
    count += 34;
}


int main()
{
    try
    {
        Finally fin(&finalizer);
        {
            Finally fin2(fin);
            throw 1;
            count += 3;
        }
        count += 7;
    }
    catch (int ex)
    {
        count++;
    }

    if (count != 735)
    {
        std::cout << "FAIL 2" << std::endl;
        return 1;
    }
    else
    {
        std::cout << "PASS 2" << std::endl;
        return 0;
    }
    
}


