

#include <iostream>

#include "../SArray.h"



int main()
{


	SArray<int> arr;
//	SArray<int> arr0;

	arr.push_back(1);
	arr.push_back(2);
	arr.push_back(3);
	arr.push_back(4);
	arr.push_back(5);
	arr.push_back(6);

	arr.push_back(7);
	arr.push_back(8);
	arr.push_back(9);

	//TODO run more array test cases then SUBMIT for the love of god
	arr.insert(arr0, 0);


	if (arr[0] != 0) return 1;


	if (arr.size() != 5) return 1;


//    SArray<int> arr;
//
//
//	arr.push_back(1);
//	arr.push_front(2);
//	arr.push_back(3);
//	arr.push_front(4);
//	arr.push_back(5);
//	arr.push_front(6);
//	arr.push_back(7);
//	arr.push_front(8);
//	arr.push_back(9);
//	arr.push_front(10);
//
//    if (arr[3] != 4) return 1;
//
//
//    if (arr.size() != 10) return 1;

    std::cout << "PASS" << std::endl;

    return 0;
}


