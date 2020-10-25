class Integer # factorial eg: !10 => 3628800
  define_method(:!) { (1..self).inject(:*) || 1 }
  define_method(:fib) { (fib = ->(n) { n <= 1 ? n : fib.(n-1) + fib.(n-2) }).(self) } # fibonacci
end

class String # blank method from ruby on rails. eg: " ".blank? => true
  define_method(:blank?) { self.to_s && self.nil? || self.empty? || self[/^[\t|\n|\s]+$/m] }
end