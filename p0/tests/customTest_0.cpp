#include <iostream>
#include <string>
#include <stdlib.h>
using namespace std;


class B
{
	private:
		int vv;

	public:
		B() : vv(0)
		{
			cout<< "B created" << endl;
		}

		B(int _vv)
		{
			cout<< "B created" << endl;
		}

		virtual ~B()
		{
			cout << "B destroyed" << endl;
		}
};

/* constructors and destructors*/
class A : public B 
{
	private:
		int val;

	public:		
		A() : B(*2), val(0)	//val(0) is basically junk in default constructor
		{
			cout << "Default A = 0 constructed" << endl;
		}

		A(int v) : val(v)
		{
			cout << "A = " << val << " A constructed" << endl;
		}

		A& operator =(int v)
		{
			this->val = v;
			cout << "A object assigned to " << v << endl;
			//same as this->val = v
			return *this;
		}

		virtual ~A()
		{
			cout << "A = " << val << " A destructed" << endl;
		}
};



int main(int argc, const char** argv){

	// A a0;
	// {
	// 	A a2(2);
	// }
	// B* b = new A(3);
	try
	{
		A a0;
		throw 5;
		A a3(3);
	}
	catch(int err)
	{

	}
	
	delete b;
	//RAII
	//Resource Allocation Is Initialization
	
	//A a;		//construct& destruct

	// A* a3 = new A(3);		//a = 3 construct & destruct
	
	// A* a0s = new A[3];
	// for(unsigned i = 0; i < 3; ++i){
	// 	a0s[i] = i;
	// 	//same as a0s[i].operator = (i);
	// }

	//malloc gives a (void*)
	// A* a3 = (A*)malloc(3*sizeof(A));		//a = 3 construct & destruct
	// for(unsigned i = 0; i < 3; i++)
	// 	new (&a3[i]) A(i);

	// a3[0]->operator = (5);	//same as a3[] = 5; also manually construct
	
	// A* a3 = new A[3];

	// delete [] a3;

	// for(unsigned i = 0; i < 3; ++i)
	// 	a3[i].~A();		//manually deconstruct
	// free (a3);

	// {
	// 	A a4(4); 
	// }
	// free (a3);
	// delete [] a0s;



	// A a;		//a = 0 construct & destruct




	//delete a;			//destruct

	return 0;
}


















// // A test for BinaryTree
// // The test returns exit code 0 for success and 1 for failure


//  #include "../BinaryTree.h"
// //#include "../AssocList.h"
// #include <iostream>
// #include <string>
// using namespace std;


// int main()
// {
//     BinaryTree<int, int> bst;

// 	int buff[10] = {12,5,2,99,1,3,33,56,4};
// 	for (int i = 0; i < 10; ++i)
// 	{
// 		// buff[i] = i*i*i;
//         bst.add(buff[i],&buff[i]);
// 		bst.size();
// 	}
// 	cout << "\nTEST 1" << endl;
// 	cout << "bst.lookup(1): " << bst.lookup(1) << endl;
// 	cout << "&buff[4]: " << &buff[4] << endl;

// 	if (bst.lookup(1) != &buff[4]){
// 		cout << "FAIL" << endl;
// 		return 1;
// 	}else{
// 		cout << "PASS" << endl;
// 	}

// 	cout << "TEST 2" << endl;
// 	cout << "bst.lookup(56): " << bst.lookup(56) << endl;
// 	cout << "&buff[7]: " << &buff[7] << endl;

// 	if (bst.lookup(56) != &buff[7]){
// 		cout << "FAIL" << endl;
// 		return 1;
// 	}else{
// 		cout << "PASS" << endl;
// 	}

// 	cout << "TEST 3" << endl;
// 	cout << "bst.lookup(0): " << bst.lookup(0) << endl;
// 	cout << "&buff[0]: " << &buff[0] << endl;
// 	if (bst.lookup(12) != &buff[0]){
// 		cout << "FAIL" << endl;
// 		return 1;
// 	}else{
// 		cout << "PASS" << endl;
// 	}

// 	// if (bst.lookup(7) != &buff[7])
//     //     return 1;

// 	// if (bst.lookup(0) != &buff[0])
//     //     return 1;
// 	return 0;
// }











// // void addstufftomap(IMap<int,void>& mp)
// // {
// // 	// Adds a key for each odd number [3,99]
// // 	// mapped to a void pointer of the same value
// //     for (int i = 3; i < 100; i += 2){
// // 		mp.add(i,(void*)(unsigned long long)i);
// // 	}
// // }


// // int main()
// // {
// //     AssocList<int, void> lst;

// // 	addstufftomap(lst);
// // 	lst.size();
// // 	if (!lst.remove(67)){
// // 		cout << "FAIL" << endl;
// // 		return 1;
// // 	} else{
// // 		cout << "PASS" << endl;
// // 	}

// // 	if (lst.remove(66)){
// // 		cout << "FAIL" << endl;
// // 		return 1;
// // 	}else{
// // 		cout << "PASS" << endl;
// // 	} 

// // 	if (lst.size() != 48){
// // 		cout << "FAIL" << endl;
// // 		 return 1;
// // 	}else{
// // 		cout << "PASS" << endl;
// // 	}

// //     if (lst.lookup(55) != (void*)55){
// // 		cout << "FAIL" << endl;
// // 		 return 1;
// // 	}else{
// // 		cout << "PASS" << endl;
// // 	}
	
// // 	return 0;
// // }







// // A test for AssocList
// // The test returns exit code 0 for success and 1 for failure


// // #include "../AssocList.h"
// // #include <iostream>
// // #include <string>
// // using namespace std;

// // int main()
// // {
// //     AssocList<int, int> list;
// //     int v = 5;
// // 	//cout << "\nStart\n" << endl;

// // 	list.add(0,&v);
// // 	cout << "\nlist.add(0,&v);\n" << endl;

// // 	list.add(1,&v);
// // 	cout << "\nlist.add(1,&v);\n" << endl;

// // 	list.add(2,&v);
// // 	cout << "\nlist.add(2,&v);\n" << endl;

// // 	list.size();
// // 	list.remove(0);
// // 	cout << "list.remove(0);" << endl;
// // 	list.size();
// // 	cout << "----------------------------" << endl;

// // 	if (list.size() != 2) return 1;
// // 	cout << "Pass1\n--------------------" << endl;

// // 	if (!list.remove(2)) return 1;
// // 	list.size();
// // 	cout << "Pass2\n--------------------" << endl;

// // 	if (!list.remove(1)) return 1;
// // 	list.size();
// // 	cout << "Pass3\n--------------------" << endl;

// // 	if (list.remove(1)) return 1;
// // 	cout << "Pass4\n--------------------" << endl;

// //     if (list.size() != 0) return 1;
// // 	cout << "Pass5\n--------------------" << endl;
	
// // 	return 0; 
// // }
