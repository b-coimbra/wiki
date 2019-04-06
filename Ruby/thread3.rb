
class Main
    def get(response)
        @response = response

        if response =~ /[Yy]/
            show()
        end
    end

    def show
        print @response
    end
end

new = Main::new
ask = Thread.new {print "Enter a field\n=> "}
get_response = Thread.new{new.get(gets.chomp)}.join
new.show()
