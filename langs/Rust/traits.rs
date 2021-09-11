trait Signed {
    fn is_negative(self) -> bool;
}

impl Signed for i32 {
    fn is_negative(self) -> bool {
        self < 0
    }
}

struct Number {
    value: i32
}

impl Number {
    fn is_positive(self) -> bool {
        self.value > 0
    }
}

fn main() {
    const NUM: i32 = -10;

    let mut n = Number {
        value: 10
    };

    n.value = 20;

    println!("{}", NUM.is_negative());
    println!("{}", n.is_positive());
}
