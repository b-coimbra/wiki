struct Rectangle {
    width: u32,
    height: u32,
}

impl Rectangle {
    fn area(&self) -> u32 {
        self.width * self.height
    }

    fn can_hold(&self, other: &Rectangle) -> bool {
        self.width > other.width && self.height > other.height
    }

    // this is an associated function, not a method
    // because they don't have an instance of the struct to work with (self)
    fn square(size: u32) -> Rectangle {
        Rectangle { width: size, height: size }
    }
}

fn main() {
    let rect = Rectangle { width: 30, height: 50 };
    let rect2 = Rectangle { width: 30, height: 45 };

    println!("Area: {}", rect.area());
    println!("rect2 fits in rect: {}", rect.can_hold(&rect2));

    // calling an associated function
    let square = Rectangle::square(3);
}
