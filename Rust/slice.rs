fn main() {
    let s = String::from("hello world");

    let word = first_word(&s[..]); // 5

    let hello = &s[0..5]; // string slice
    // or just:
    // let hello = &s[..word]; // string slice
}

// fn first_word(s: &String) -> usize {
//     let bytes = s.as_bytes();

//     for (i, &item) in bytes.iter().enumerate() {
//         if item == b' ' {
//             return i;
//         }
//     }

//     s.len()
// }

// the type that signifies 'string slice' is &str:

fn first_word(s: &str) -> &str {
    let bytes = s.as_bytes();

    for (i, &item) in bytes.iter().enumerate() {
        if item == b' ' {
            return &s[..i];
        }
    }

    &s[..]
}
