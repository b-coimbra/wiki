#include <iostream>
#include <cstdlib>

int main(int argc, char *argv[0])
{
	static int (*self)(int) = [](int i)->int { return i <= 1 ? i : self(i-1) + self(i-2); };
	std::cout << self(atoi(argv[1]));
}