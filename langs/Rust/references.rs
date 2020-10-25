fn main() {
    // passing the reference to a method allows the variable to keep the ownership of its value

    let str = String::from("hello");

    let length = get_length(&str);

    println!("The length of '{}' is {}", str, length);

    // if we want to modify something we're borrowing, we can pass a mutable reference:
    let mut s = String::from("hello");

    change(&mut s);

    // to create multiple mutable references:

    let s1 = &mut s;
    {
        let mut s2 = &mut s;
    } // s2 goes out of scope, so we can make a new reference with no issues.
}

fn get_length(str: &String) -> usize {
    str.len()
}

fn change(str: &mut String) {
    str.push_str(", world");
}
