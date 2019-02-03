/***************************************************
 * Lab 3 -- Part 2: reverse.js 
 *  	
 * The goal of this task is to read in a sequence of integers read 
 * via STDIN and then print them to STDOUT in reverse order (one per line).  	
 *		  
 *************************************************		  
 */  	


var readline = require('readline');


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


var rl = readline.createInterface({
    input: process.stdin,  	
    output: process.stdout,	
    terminal: false  	
});  	

var nums  = []; 

rl.on('line',		  
      (chunk) =>
      {
          nums.push(chunk.trim());
      });  	


rl.on('close',
      () =>		  
      {
          nums.reverse((a, b)=>b-a);
          nums.map((n) => ""+n);
          console.log(nums.join("\n"))
          // TODO: print out nums, one per line
      });
		  
  	
		  
