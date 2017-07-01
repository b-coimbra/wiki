
def sum_consecutives(s)
    s.chunk {|n| n}.map(&:last).map {|group| puts group.inject(:+)}
end
sum_consecutives([1,4,4,4,0,4,3,3,1])
