use std::fs::File;
use std::io::ErrorKind;

fn main() {
    // unrecoverable error:
    // panic!("crash and burn");

    // recoverable errors with Result
    //let f = match File::open("hello.txt") {
    //    Ok(file) => file,
    //    Err(error) => panic!("Problem opening the file: {:?}", error),
    //};

    // the snippet above will panic! no matther why File::open failed
    // we can match the error type and handle it like so:
    let f = File::open("hello.txt");

    let f = match f {
        Ok(file)   => file,
        Err(error) => match error.kind() {
            ErrorKind::NotFound => match File::create("hello.txt") {
                Ok(fc) => fc,
                Err(e) => panic!("Could not create file: {:?}", e),
            },
            other_err => panic!("Problem opening file: {:?}", other_err),
        },
    };

    // unwrap is a shortcut method implemented just like the match expression above
    // if the Result value is Ok, unwrap will return the value inside Ok
    // if the Result is Err, unwrap will call the panic! macro.
    // let f = File::open("hello.txt").unwrap();

    // another method is expect, and it lets us choose the panic! error message:
    // let f = File::open("hello.txt").expect("Failed to open hello.txt");
}
