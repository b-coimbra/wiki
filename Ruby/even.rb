def iq_test(numbers)
    numbers.split.map(&:to_i).each do |i|
        if i.odd?
            return i unless i.even?
        else
            return i
        end
    end
end
puts iq_test("4 2 3")
