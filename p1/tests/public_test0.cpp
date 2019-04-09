

#include <iostream>

#include "../SArray.h"
#include "../CArray.h"


int main()
{

//    SArray<int> arr;
//    CArray<int> arr0;
//
//    arr0.push_back(98);
//    arr0.push_back(45);
//    arr0.push_back(22);
//
//    arr.push_back(3);
//    arr.push_back(4);
//    arr.push_back(5);
//    arr.push_back(6);
//    arr.push_back(7);
////    arr.print();
//
//    arr.insert(arr0,arr.size());
//    std::cout << "" << std::endl;
//    arr.print();
//
//    arr.remove(5);
////    arr.print();
//    if (arr.size() != 7) return 1;
//
//    if (arr[0] != 98 || arr[5] != 6) return 1;
//
//    std::cout << "PASS" << std::endl;
//    return 0;





    SArray<int> arr;
    CArray<int> arr0;

    arr0.push_back(0);

	arr.insert(arr0,0);

	arr.push_back(1);
	arr.push_front(2);
	arr.push_back(3);
	arr.push_front(4);
	arr.push_back(5);
	arr.push_front(6);
	arr.push_back(7);

    arr.remove(5);

    if (arr.size() != 7) return 1;

    if (arr[0] != 6 || arr[5] != 5) return 1;

    std::cout << "PASS" << std::endl;
    return 0;
}
