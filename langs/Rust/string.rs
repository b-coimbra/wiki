fn main() {
    let mut s = String::new();

    s.push_str("hello"); // append string slice
    s.push('!'); // appends a char

    // String::from() and .to_string() is equivalent.

    for c in s.chars() {
        println!("{}", c);
    }
}
