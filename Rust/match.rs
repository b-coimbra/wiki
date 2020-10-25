
enum Coin {
    Penny,
    Nickel,
    Dime,
    Quarter,
}

fn value_in_cents(coin: Coin) -> u8 {
    match coin {
        Coin::Penny => {
            println!("Lucky coin!");
            1
        },
        Coin::Nickel  =>  5,
        Coin::Dime    => 10,
        Coin::Quarter => 25,
    }
}

fn main() {
    
}
