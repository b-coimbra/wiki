#include <iostream>

template <class T>
class MyClass {
    T first, second;
public:
    MyClass(T a, T b) {
        first = a;
        second = b;
    }
    T bigger();
};

template <class T>
T MyClass<T>::bigger() {
    return (first > second ? first : second);
}

int main(int argc, char **argv[])
{
    MyClass <int>cl(30, 12);
    std::cout << cl.bigger();
}
