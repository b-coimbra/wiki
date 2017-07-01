# 1

def calc(c)
	return eval(c.gsub(/\[/,"(") \
	.gsub(/\]/,")") \
	.gsub(/(modulus|mod)/i,"%") \
	.gsub(/(subtract|minus)/i,"-") \
	.gsub(/(add|plus)/i,"+") \
	.gsub(/(\^|power by)/i,"**") \
	.gsub(/(×|∙|multiplied by)/i,"*") \
	.gsub(/(divided by|÷)/i,"/") \
	.gsub(/[^0-9\s\-\(\)^*+\/]/,"")) rescue return false
end
puts calc("3 minus 5")
puts calc("5 + 5")
puts calc("5 - 5")

# 2

def calc(operator, v1, v2)
    eval("#{v1}#{operator}#{v2}")
end
puts calc('+','3','3')
puts calc('*','3','3')
puts calc('-','3','3')
puts calc('/','3','3')

# 3

def calc2(operator, v1, v2)
    v1.send(operator, v2)
end

# 4

argu = "10 - 11"
argu.split.map do |i|
    if i["+"]
        puts i.split.map(&:to_i).reduce(:+)
    elsif i["-"]
        puts i.split.map(&:to_i).reduce(:-)
    end
end

# 5

def calc(a, b, operator)
    ar = {"add"=>a+b,"subtract"=>a-b,"multiply"=>a*b,"divice"=>a.div(b)}
    ar[operator]
end

# 6

GET = gets.chomp

if GET =~ /\d|\s|[\+]/im
    GET.each_char do |x|
        sum = x[0]+ x[-1]
        print sum.to_s.gsub(/0\s*/, '').insert(-1, ' ')
    end
end

# or
if GET.include? '+'
    GET.split(' ').each do |i|
        print i[0].split('+').map {|x| print x[0].to_i + x[-1].to_i}
        -> (y) {print y[0].to_i + y[-1].to_i}.call(i)
    end
end

puts gets.split.map(&:to_i).inject(:+)

# 7

def numbers_with_digit_inside(x, d)
    if x != nil && d != nil
        count = x, d
        sum = count.map(&:to_i).inject(:+)
        product = sum * sum
        return count.length, sum, product
    end
end
