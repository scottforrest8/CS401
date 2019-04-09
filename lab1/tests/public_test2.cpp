

#include <iostream>
#include <string>
using namespace std;
#include "../CArray.h"



int main()
{
    CArray<int> arr;
	arr.push_back(5);
	arr.push_front(4);
	arr.push_back(7);
	arr.push_front(3);
	arr.insert(6,3);
	arr.insert(arr,0);
	arr.remove(2,5);

	cout << "1" << endl;
    if (arr.find(3) != 0) return 1;
	cout << "2" << endl;
    if (arr.find(5) != 2) return 1;
	cout << "3" << endl;
    if (arr.find(6) != 3) return 1;
	cout << "4" << endl;
    if (arr.find(15) >= 0) return 1;
    
    return 0;
}

