#include <iostream>
#include <vector>

int main()
{
    std::vector<int> nums = {1, 2, 3};

    for (auto i : nums)
        std::cout << i << std::endl;

    return 0;
}