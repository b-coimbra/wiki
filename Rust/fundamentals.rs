use std::io;

fn main() {
    println!("Enter a number");

    let mut guess = String::new();

    io::stdin().read_line(&mut guess)
        .expect("Failed");
}

