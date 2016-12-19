#include <iostream>
#include "type2str.h"

int main(){
    int num;

    std::cout << "OpenCV Type Number: ";
    std::cin >> num;
    std::cout << "Type: " << type2str(num) << std::endl;
}
