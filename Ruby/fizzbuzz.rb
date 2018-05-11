->(lim){(1..lim).map{|i|p i%15==0? 'FizzBuzz': i%5==0? 'Buzz' : i%3==0? 'Fizz' : i}}.(100)

1.upto(100){|n|puts'FizzBuzz'[i=n**4%-15,i+13]||n}
