// playing around with js

const $ = (x) => document.querySelector(x);

(function() {
    ((a, b) => { console.log(a + b) })(3, 5); // 8

    // one liner fizzbuzz
    const fizzbuzz = function(n) { return Array.from({length:n},(_,i)=>i+1)
        .map((n)=> n % 15 == 0 ? 'FizzBuzz' : (n % 3 == 0 ? 'Fizz' : (n % 5 == 0 ? 'Buzz' : n))) };

    // variadiac argument
    ((a, b, ...c) => { console.log(`c has ${c}`) })(1, 2, "a", 3, "b", "c", "5");

    array = ["a", "b", "c"];
    // iterating through array
    for (var i in array) console.log(i);
    array.forEach((i) => { console.log(i) });
    array.map((i) => { console.log(i) });
})();