#include <iostream>
#include <string>
#include <vector>

int main(int argc, char *argv[])
{
    std::cout << "Enter your name: ";
    std::string name;
    std::cin >> name;

    const std::string greeting = "Hello, " + name + "!";

    typedef std::vector<int>::size_type vec_sz; // unsigned type
    vec_sz size = greeting.size();

    std::cout << greeting << " has: " << size << " letters";

    return 0;
}
