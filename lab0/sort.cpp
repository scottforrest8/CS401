/***************************************************  	
 * Lab 0 -- Part 1: sort.cpp		  
 *		  
 * The goal of this task is to use an array to sort a sequence of numbers  	
 * and to print the numbers read via STDIN to STDOUT in increasing order (one per line).  	
 * 
 ************************************************* 
 */ 

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

int main(int argc, const char** argv)
{
	//end == array size & buffer == the array itself

	// Allocate space for up to 500 numbers (no test will exceed this size)  	
	int buffer[500];

	// Push each integer read into the array, in order		  
	// Note that std::cin >> n reads the next number into variable
	// and returns true or returns false if EOF is reached (really, a falsy object).
	int n,end; 
	for (end = 0; std::cin >> n; ++end)
        buffer[end] = n; 

	// TODO: Use a sorting algorithm of your choice		  
	//       (e.g., bubblesort, insertionsort, quicksort)  	
	//       to sort the numbers in buffer (increasing order) 
	// ...

	int i, key, prev; 
	for (i = 1; i < end; i++) 
	{ 
		key = buffer[i]; 
		prev = i-1; 
	
		/* Move elements of arr[0..i-1], that are 
			greater than key, to one position ahead 
			of their current position */
		while (prev >= 0 && buffer[prev] > key) 
		{ 
			buffer[prev + 1] = buffer[prev]; 
			prev = prev-1; 
		} 
		buffer[prev + 1] = key; 
	} 
 
	// Print out integers in sorted order (one per line)  	
	for (int i = 0; i < end; ++i)
		std::cout << buffer[i] << std::endl;  	
 
	// Exit with error code 0 (success)  	
	return 0;	
} 


