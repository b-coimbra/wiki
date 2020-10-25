const fizzbuzz = function(n) { return Array.from({length:n},(_,i)=>i+1).map((n)=>n%15==0?'FizzBuzz':(n%3==0?'Fizz':(n%5==0?'Buzz':n))) }
