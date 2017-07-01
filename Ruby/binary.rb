def fake_bin(s)
    s.split("").map(&:to_i).each {|i| return i < 5 ? '0' : '1'}
end
puts fake_bin('45385593107843568')
