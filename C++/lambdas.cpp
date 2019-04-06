#include <iostream>
#include <vector>

enum class Color { red, blue, green };

int main(int argc, char *argv[])
{
    Color col = Color::red;

    std::vector<int> vec;

    // if (argc > 1)
    //     for (int i = 0; i < atoi(argv[1]); i++)
    //         vec.push_back(argv[1][i]);

    // for (auto i : vec)
    //     std::cout << i << "\n";


    // lambdas +---- CAPTURE CLAUSE ---------------------+
    auto sum = [](int num)->int { return num + 1; }; //  |
    //         +-----------------------------------------+
    // [&epsilon] capture by reference
    //     [&] captures all variables used in the lambda by reference
    //     [=] captures all variables used in the lambda by value
    //     [&, epsilon] captures variables like with [&], but epsilon by value
    //     [=, &epsilon] captures variables like with [=], but epsilon by reference
    sum(4); // 5

    return 0;
}
