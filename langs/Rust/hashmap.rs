use std::collections::HashMap;

fn main() {
    let mut scores = HashMap::new();

    // there's no macro for inserting hashmaps
    // since it's not used as much
    scores.insert(String::from("Blue"), 10);
    scores.insert(String::from("Red"), 20);

    // overwrites a value
    scores.insert(String::from("Blue"), 15);

    // only inserting a value if the key has no value
    scores.entry(String::from("Yellow")).or_insert(50);

    for (key, value) in &scores {
        println!("{} = {}", key, value);
    }

    let teams = vec![String::from("Blue"), String::from("Yellow")];
    let initial_scores = vec![10, 50];

    // we use HashMap<_, _> so rust can infer the types that the hash map
    // contains based on the types of the data in the vectors.
    let scores_map: HashMap<_, _> = teams.iter().zip(initial_scores.iter()).collect();

    let team_name = String::from("Blue");

    if let Some(s) = scores_map.get(&team_name) {
        println!("{}", s);
    }

    let text = "hello world wonderful world";
    println!("{:?}", count_words(text));
}

fn count_words(str: &str) -> HashMap<&str, i32> {
    let mut map = HashMap::new();

    for word in str.split_whitespace() {
        let count = map.entry(word).or_insert(0);
        *count += 1;
    }

    map
}
