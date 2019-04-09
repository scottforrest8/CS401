// //The unsigned keyword is a data type specifier, that 
// //makes a variable only represent positive numbers and zero. 
// //It can be applied only to the char , short , int and long types.


// #include <iostream>
// #include <string>
// using namespace std;

// #include "../CArray.h"


// int main()
// {
//     CArray<int> arr;
// 	arr.push_back(5);
// 	arr.push_front(4);
// 	arr.push_back(7);
// 	arr.push_front(3);
// 	arr.insert(6,3);
// 	arr.insert(arr,0);
// 	arr.remove(2,5);
// 	for (int z = 0; z < arr.size(); z++){
//             cout << arr[z] << ", ";
//         }

// 	cout << "\n1" << endl;
//     if (arr.find(3) != 0) return 1;
// 	cout << "2" << endl;
//     if (arr.find(5) != 2) return 1;
// 	cout << "3" << endl;
//     if (arr.find(6) != 3) return 1;
// 	cout << "4" << endl;
//     if (arr.find(15) >= 0) return 1;
    
//     return 0;
// }

// // int main()
// // {
// //     CArray<int> arr;
// // 	arr.push_back(5);
// // 	arr.push_front(4);
// // 	arr.push_back(7);
// // 	arr.push_front(3);
// // 	arr.insert(6,3);
// // 	arr.insert(arr,0);
// // 	arr.remove(2,5);
// // 	cout << "\n" << endl;
// // 	int eq[5] = {3,4,5,6,7};
// // 	for (unsigned i = 0; i < arr.size(); ++i)
// // 		// cout << "eq[i]: " << eq[i] << endl;
// // 		// cout << "arr[i]: " << arr[i] << endl;
// // 		if (eq[i] != arr[i]){
// // 			cout << "FAIL" << endl;
// // 			return 1;
// // 		}else{
// // 			cout << "PASS" << endl;
// // 		}
			

// //     return 0;
// // }



// // int main()
// // {
// //     CArray<int> arr;
// // 	arr.push_back(5);
// // 	arr.push_front(4);
// // 	arr.push_front(3);

// // 	int eq[5] = {3,4,5};
// // 	for (unsigned i = 0; i < arr.size(); ++i){
// // 		// cout << "eq[i]: " << eq[i] << endl;
// // 		// cout << "arr[i]: " << arr[i] << endl;

// // 		if (eq[i] != arr[i]){
// // 			cout << "FAIL" << endl;
// // 			return 1;
// // 		}else{
// // 			cout << "Pass" << endl;
// // 		}
// // 	}
// //     return 0;
// // }
