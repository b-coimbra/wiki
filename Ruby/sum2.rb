def _1()
    x = y = 10
    puts x + y
end

def _2()
    sum = lambda{|x,y| puts x+y,x-y,x*y,x/y}
    sum.call 3,5
end

def _3()
    def a(c)
        return (9*c+160)/5
    end

    puts a(32)
end

def _4()
    x = lambda{|x| puts "Maior que dez" if x >= 10}
    x.call 11
end

puts _1(),_2(),_3(),_4()
