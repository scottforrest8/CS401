/*  	
 * Project 2 -- imp.js -- interp_A, interp_B, interp_C funcitons that model taking a step		  
 *                        in the big-step semantics for IMP shown in slides. (For 401 and 501.)
 *************************************************
 *  	
 * Your job is to finish the three functions below that model the derivation step		  
 * (in our big-step semantics from the slides in class) of the =>_A, =>_B, and =>_C		  
 * step functions.
 *
 * interp_A takes an arithmetic expression, like {form: 'x', x: 'z'},
 * and a state/store, like (x) => {if (x == 'z') return 7;}, and yields a number, like 7.
 *
 * interp_B takes a boolean expression and a store to a boolean,
 *
 * and interp_C takes a command and a store to a new store (i.e., the program state, a model of the heap).
 * Note that the current store is a javascript function that should take some variable
 * (program location) and yield its current value in the store. (Note the definition of  	
 * sigma[x \mapsto n] in the slides.) See ast.js for a definition of some convenience
 * functions for producing an AST that define the different language forms as JSON objects.  	
 *  	
 ***************************************************  	
 */		  

  	
exports.interp_A = interp_A;  	
exports.interp_B = interp_B; 
exports.interp_C = interp_C;  	


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


function interp_A(a, store)
{
    // TODO: Add interpretations for '*' and '-' expressions
    if (a.form == 'x')
	    return store(a.x);

    else if (a.form == 'n')
	    return a.n;

    else if (a.form == '+')
	    return interp_A(a.a0, store) + interp_A(a.a1, store);

    else if (a.form == "-")
        return interp_A(a.a0, store) - interp_A(a.a1, store);

    else if (a.form == "*")
        return interp_A(a.a0, store) * interp_A(a.a1, store);

    console.log(`failed to interpret: ${a} \nwith store: ${store}`);  	
} 
  	
function interp_B(b, store) 
{ 
    // TODO: What other boolean expressions need to be handled in this function?  	
    if (b.form == 'not')
	    return !interp_B(b.b, store);

    else if (b.form == 'true')
	    return true;

    else if (b.form == "false")
        return false;

    else if (b.form == "or")
    {
        if (interp_B(b.b0, store))
            return true;
        else
            return interp_B(b.b1, store);
    }

    else if (b.form == "and")
    {
        if (interp_B(b.b0, store))
            return interp_B(b.b1, store);
        else
            return interp_B(b.b0, store);
    }

    else if (b.form == "=")
        return interp_A(b.a0, store) == interp_A(b.a1, store);

    else if (b.form == "<=")
        return interp_A(b.a0, store) <= interp_A(b.a1, store);

    console.log(`failed to interpret: ${b} \nwith store: ${store}`);		  
}		  

function interp_C(c, store)  	
{
    // TODO: What other commands need to handled in this function?
    if (c.form == 'skip')
	    return store;

    else if (c.form == ";")
        return interp_C(c.c1, interp_C(c.c0, store));

    else if (c.form == ":=")
        return (x) => {if (c.x == x) return interp_A(c.a, store); else return store(x);};

    else if (c.form == "if")
    {
        if (interp_B(c.b, store))
            return interp_C(c.c0, store);
        else return (interp_C(c.c1, store));
    }
    else if (c.form == "while")
    {
        while (interp_B(c.b, store))
            store = interp_C(c.c, store);
        return store;
    }

    console.log(`failed to interpret: ${b} \nwith store: ${store}`);		  
}



