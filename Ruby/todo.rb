=begin
    1 - user writes first
    2 - program returns list
    3 - read input from user (Delete: Y/N -> which item?: n)
=end

y = Thread.new {
    print "Write a list\n=> "
    Thread.current["intro"]
}
def user_input(res)
    while res !~ /[Qq]/
        Thread.current
    end
    Thread.kill(get)
end
get = Thread.new{user_input(gets.chomp)}
get.join
