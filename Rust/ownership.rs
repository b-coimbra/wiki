fn main() {
    let num: i32 = 5;
    let str = String::from("hello world");

    copy_value(num);
    take_ownership(str);

    // `str` becomes an invalid reference since the value's ownership was taken
    // String is not a literal string, copying its contents over would be too costly
    // so it's better to just point to the value in the heap.

    // But since num's valued was copied, we can still reference it:
    println!("{}", num);

    // we also can create another variable pointing to it, and the values of num will be copied over
    // since it's a fixed value:
    let num_copy = num;

    // When a variable goes out of scope, the method `drop` is automatically called
    // by the compiler to return the allocated memory to the operating system.
    // So when we point a variable to str, we don't expect the value to be copied,
    // only the pointer to the value stored in the heap:
    // let str_ptr = str;
    // which would give us an error, since the value's ownership was taken by the take_ownership method before.

    // We can also receive the ownership of a value:
    let receive_str = give_ownership();

    // and also take and give it back:
    let mut str2 = String::from("hello");
    str2.push_str("!"); // push_str() appends a literal to a String
    let receive_back = take_and_give(str2);
}

/*
types that are Copy:
- All integer types, such as u32
- Boolean type
- Floating point types, such as f64
- char
- Tuples if they contain types that are also Copy. For instance, (i32, i32) is Copy, but (i32, String) is not.
*/

fn copy_value(num: i32) {
    println!("'{}' is copied because i32 is a literal value of type Copy \
             and goes to the stack, thus keeping its ownership intact.", num)
}

fn take_ownership(str: String) {
    println!("str only points to the value being held in the heap, instead of copying it. \
              The ownership of the value '{}' is taken by the calling method.", str)
}

fn give_ownership() -> String {
    let str = String::from("hello world");

    str
}

fn take_and_give(str: String) -> String {
    str
}
