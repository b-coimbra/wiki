fn main() {
    // necessary to add type annotation when we're not inserting any value initially
    let mut v: Vec<i32> = Vec::new();
    // otherwise we can just use the macro vec!
    // let v = vec![1, 2, 3];

    // vector needs to be mutable to change its value
    v.push(1);
    v.push(2);
    v.push(3);

    // --
    // there are two ways of getting the index value of a vector
    // either by using []
    // or by using the method get(index) which gives us an Option<&T>
    let v2 = vec![1, 2, 3, 4];

    let third: &i32 = &v2[2];
    println!("Third element: {}", third);

    match v2.get(2) {
        Some(third) => println!("The third element is: {}", third),
        None        => println!("There is no 3rd element."),
    };

    for i in &v2 {
        println!("{}", i);
    }

    let mut nums = vec![30, 40, 50];

    for i in &mut nums {
        *i += 50;
    }
}
