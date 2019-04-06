require 'net/http'
require 'uri'

class Main
    def initialize
        @url = "http://xat.com/web_gear/chat/search.php"
        $search = "xatspace"
    end

    def open
        @res = Net::HTTP.post_form(URI.parse(@url), {'search'=>"#{$search}", 'max'=>'50'})
        view
    end

    def view
        begin
            print @res.body
        rescue StandardError => e
            print "Couldn't connect to the url."
        end
    end
end

main = Main::new
main.open
