
// we define an enum when we're able to enumerate all possible values
// and only one possible value can be given at a time
// eg. an IP address can only be V4 or V6
enum IpAddrKind {
    V4,
    V6,
}

// struct IpAddr {
//     kind: IpAddrKind,
//     address: String,
// }

// we can represent the same struct above using only enums
// enum IpAddr {
//     V4(String),
//     V6(String),
// }

// since ip type four always have 4 numeric components between 0 and 255
// we can define the V4 addresses as four u8:
enum IpAddr {
    V4(u8, u8, u8, u8),
    V6(String),
}

enum Message {
    Quit,
    Move { x: i32, y: i32 },
    Write(String),
    ChangeColor(i32, i32, i32),
}

// we can also define methods for enums using impl:
impl Message {
    fn call(&self) {
        // do something
    }
}

fn main() {
    let four = IpAddrKind::V4;
    let six = IpAddrKind::V6;

    // let home = IpAddr {
    //     kind: IpAddrKind::V4,
    //     address: String::from("127.0.0.1"),
    // };

    // let loopback = IpAddr {
    //     kind: IpAddrKind::V6,
    //     address: String::from("::1"),
    // };

    // let home = IpAddr::V4(String::from("127.0.0.1"));

    let home = IpAddr::V4(127, 0, 0, 1);
    let loopback = IpAddr::V6(String::from("::1"));

    let message = Message::Write(String::from("hello"));
    message.call();

    route(four);
}

fn route(ip: IpAddrKind) {
    
}
