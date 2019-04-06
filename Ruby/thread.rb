def func()
    x=0
    while x <= 10
        puts "#{x}"
        x=x+1
        sleep(0.5)
    end
end

x = Thread.new{func()}
x.join
