// playing around with js

const $ = (x) => document.querySelector(x);

(function() {
    ((a, b) => { console.log(a + b) })(3, 5); // 8

    // one liner fizzbuzz
    const fizzbuzz = function(n) { return Array.from({length:n},(_,i)=>i+1)
        .map((n)=> n % 15 == 0 ? 'FizzBuzz' : (n % 3 == 0 ? 'Fizz' : (n % 5 == 0 ? 'Buzz' : n))) };

    // replaces id elem with 01<num>
    var ids = document.querySelectorAll('.ids');
    for (var i = 0; i < ids.length; i++)
        if ((ids[i].indexOf(/^id=(\d)/g, 0)) != -1)
            setTimeout(()=> { ids[i].innerHTML.toString().replace(/$1/, '01'+$1); }, 500);

    // search google through input form
    $(".input").addEventListener("keyup", (e) => {
        if (e.key == 'Enter')
            window.location = "https://google.com/search?q=" + e.target.value;
    });

    // variadiac argument
    ((a, b, ...c) => { console.log(`c has ${c}`) })(1, 2, "a", 3, "b", "c", "5");

    array = ["a", "b", "c"];
    // iterating through array
    for (var i in array) console.log(i);
    array.forEach((i) => { console.log(i) });
    array.map((i) => { console.log(i) });
});