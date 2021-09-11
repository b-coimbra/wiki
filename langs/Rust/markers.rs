use std::marker::{Copy};

struct Number {
    value: i32
}

impl Copy for Number { }

impl Number {
    fn neg(self) -> Number {
        Number {
            value: -self.value
        }
    }
}

fn main() {
    let n = Number {
        value: 30
    };

    println!("{}", n.neg());
}
