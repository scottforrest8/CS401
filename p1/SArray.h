/* 
 * Project 1 -- SArray reallocating array class (CS 401 and 501)  	
 *************************************************	
 *  	
 * Your job is to finish writing this class to suit the 
 * set of tests provided. Be sure to read IArray.h and AArray.h 
 * before you begin. Your SArray class should improve on the
 * efficiency of the CArray class by allocating a buffer twice		  
 * as large when needed. Look for "TODO"s that you must complete.  	
 *		  
 ***************************************************		  
 */		  
  	
                    //Whats left: Iter Class & clear() & reallocate
#pragma once		  

#include "AArray.h"

#include <iostream>


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

 
// This is a simple managed array class that will allocate 
// new space to grow/shrink its buffer "under the hood"  	
template<typename T> 
class SArray 
    : public AArray<T>  	
{ 
private: 
    unsigned capacity;	

    // Use a private helper method to resize the current buffer?		  
    void reallocate(unsigned cap) {

        // TODO: Reallocate the current buffer to be
        //       at least twice as large

        // Write a helper method to determine new size?
        this->capacity = nextsize(cap);

        T* newbuffer = new T[this->capacity];

            for (unsigned i = 0; i < this->size(); i++)
            {
                newbuffer[i] = this->buffer[i];
            }

        delete [] this->buffer;
        this->buffer = newbuffer;
    }

public:		  
    SArray()  	
        : capacity(0)
    {
    }

    SArray(const AArray<T>& other) 
        : AArray<T>(other), capacity(0)		  
    {		  
    }		  
		  
    virtual ~SArray() 
    {
    }  	

    virtual void insert(const T& elem, unsigned pos) 
    {
        if (pos > this->size()) 
            throw IArray<T>::ARRAY_OVERFLOW;

        // TODO: write an insert method

        if (pos == this->capacity || (this->capacity - 1) == this->size()||this->capacity == this->size())
            this->reallocate(this->capacity);

            if(this->size() > 0)
            {
                for(unsigned i = this->size()+1; i > pos; --i)
                    this->buffer[i] = this->buffer[i-1];
            }
            this->buffer[pos] = elem;
            ++this->count;
    }

    virtual void insert(const IArray<T>& other, unsigned pos)
    {
        // TODO: write an insert method

        if (pos > this->size())
            throw IArray<T>::ARRAY_OVERFLOW;

        unsigned totalSize = this->size() + other.size();

        while(totalSize > this->capacity)
            this->reallocate(this->capacity);

        if(other.size() > 0)
        {
            for(unsigned i = totalSize; i >= pos + other.size() ; --i)
            {
                this->buffer[i] = this->buffer[i - other.size()];
            }
            for(unsigned i = pos; i < other.size() + pos; ++i)
            {
                this->buffer[i] = other[i - pos];
            }
        }
        this->count += other.size();
    }

    virtual void remove(unsigned pos, unsigned num = 1)  	
    { 
        // TODO: write a remove method
        if (num == 0) return;
        if (pos + num - 1 > this->size()) return;

        for(unsigned i = pos + num; i < this->size(); ++i)
        {
            this->buffer[i - num] = this->buffer[i];
        }
        this->count -= num;
    }

    void print ()
    {
        for(int i = 0; i < this->size();i++)
        {
            std::cout << i << ": " << this->buffer[i] << std::endl;
        }
    }

    unsigned int nextsize(unsigned capacity)
    {
        if (capacity != 0)
            return capacity *= 2;
        return capacity += 1;
    }

    virtual void clear()
    {
        this->AArray<T>::clear();
        this->capacity = 0;
        // TODO: is this complete?
    }		  

    // An iterator for SArray instances
    class Iter 
        : public AArray<T>::Iter //inherents AAray's Iter class
    {		  
        // TODO: Does more need to be implemented here?
    public:
        Iter(SArray<T>& outerarr) : AArray<T>::Iter(outerarr){}

        ~Iter()
        {
        }
    };		  
};		  



