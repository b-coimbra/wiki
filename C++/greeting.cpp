#include <iostream>
#include <string>

int main(int argc, char *argv[])
{
    std::cout << "Enter your name: ";
    std::string name;
    std::cin >> name;

    const std::string greeting = "Hello, " + name + "!";

    const std::string spaces(greeting.size(), ' ');
    const std::string padding = "* " + spaces + " *";
    const std::string line(padding.size(), '*');

    std::cout << std::endl;
    std::cout << line << std::endl;
    std::cout << padding << std::endl;
    std::cout << "* " << greeting << " *" << std::endl;
    std::cout << padding << std::endl;
    std::cout << line << std::endl;

    return 0;
}
