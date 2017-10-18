#include <iostream>
#include <vector>

struct Vector {
    int sz;
    double *elem;
};

void vector_init(Vector& v, int s)
{
    v.elem = new double[s];
    v.sz = s;
}

class Vector {
public:
    Vector(int s) :elem {new double[s]}, sz {s} {} // construct a vector
    double& operator[](int i) { return elem[i]; } // element access
    int size() { return sz; }
private:
    double *elem;
    int sz;
};

int main(int argc, char *argv[])
{
    std::vector<int> vec = {3, 5, 6};
    vec.push_back(5);

    int *pos = &vec[3];

    std::cout << *pos << std::endl;

    for (auto i = 0; i < vec.size(); i++)
        std::cout << vec[i] << ' ';
    // or
    for (auto i : vec)
        std::cout << i;

    // for (auto& i : vec) ++i

    const std::string name = "John";
    typedef std::vector<double>::size_type vec_sz;
    vec_sz size = name.size();

    return 0;
}
