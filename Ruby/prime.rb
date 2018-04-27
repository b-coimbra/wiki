

(print"Limit: "; ->max { v=[]; (2..max).each{ |n| v.any? { |l| n % l == 0 } ? nil : v.push(n)}; puts v })[gets.to_i]

