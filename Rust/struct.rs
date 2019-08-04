
struct User {
    username: String,
    email: String,
    sign_in_account: u64,
    active: bool,
}

#[derive(Debug)] // just so we can use println! Debug
struct Rectangle {
    width: u32,
    height: u32,
}

fn main() {
    // accessing struct:
    let user = build_user(String::from("mail@mail.com"), String::from("user@mail.com"));

    // if we want to create an instance with some of the values from user,
    // but update other values, we would do:
    //let user2 = User {
    //    email: String::from("email@mail.com"),
    //    username: String::from("user123"),
    //    active: user.active,
    //    sign_in_account: user.sign_in_account,
    //};

    // but using struct update syntax, we can use '..' to specify the remaining
    // fields not explicitly set to the same value as the fields in the given instance
    let user2 = User {
        email: String::from("email@mail.com"),
        username: String::from("user123"),
        ..user
    };

    // let rect: (u32, u32) = (30, 50);
    // println!("Area: {}", area(rect));

    let rect = Rectangle { width: 30, height: 50 };

    println!("Area: {}", area(&rect));

    // output format with Debug
    println!("Values: {:?}", rect);
    println!("Values: {:#?}", rect);
}

// fn area(dimensions: (u32, u32)) -> u32 {
//     dimensions.0 * dimensions.1
// }

fn area(dimensions: &Rectangle) -> u32 {
    dimensions.height * dimensions.height
}

fn build_user(username: String, email: String) -> User {
    // when he parameter name is the same as the struct's
    // we can use the shorthand syntax without having to repeat ourselves
    // by doing email: email, username: username etc
    User {
        email,
        username,
        active: true,
        sign_in_account: 1,
    }
}
