/*  	
 * Lab 2 -- Finally class		  
 *************************************************  	
 *  	
 * The goal of this lab is to write a Finally class that stores a function pointer		  
 * to be called when the object is destroyed---so it can be used to simluate a
 * try { ... } finally { ... } pattern, which C++ supports via the RIAA paradigm.  	
 *
 *************************************************** 
 */ 

  	
#pragma once

/*************************************************  	
 * Honor pledge (please write your name.)		  
 * 
 * I **Scott Forrest** have completed this code myself, without		  
 * unauthorized assistance, and have followed the academic honor code.  	
 * 
 * Edit the code below to complete your solution. 
 *		  
 ***************************************************	
 */ 
 

// Your job is to put together a class Finally that takes		  
// a function pointer (taking no arguments and returning void):  	
// e.g., Finally fin(&my_finalizer_function);
// at initialization, and that has a copy constructor:		  
// e.g., Finally fin(other_finally_object);		  
// and that invokes the provided finalizer function whenever its 
// destructor is run. See /tests/*.cpp for examples of its use.
class Finally	
{		  
    // TODO 
    void(*foo)();//declaring a function pointer 
                    //called *foo which takes no 
                    //arguments and returns void
    public:
        
        //Finally(){} //default constructor

        Finally(void (*bar)()): foo(bar){}
        // {
        //     //constructor taking in function pointer
        //     //taking no arguments that returns void

        //     foo = bar;//setting bar to foo
        // }

        virtual ~Finally()//destructor
        {
            (*foo)();
        }
};  	