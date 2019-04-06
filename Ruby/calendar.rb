require 'date'
def cal(offset, month_length)
  month = Time.now.strftime("%m").to_i
  day = Time.now.strftime("%d").to_i
  puts "#{Date::MONTHNAMES[month]} #{month}".rjust(month_length / 2)
  [*1..month_length].unshift(*Array.new(offset)).
    each_slice(7).map { |week|
      week.map { |date| "%3s" % date }.join " "
    }.unshift "Mon Tue Wed Thu Fri Sat Sun"
end

puts format_calendar 2, 31