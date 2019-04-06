
["aes"].each do |lib|
    begin
        require lib
    rescue LoadError
        system "gem install #{lib}"
        Gem.clear_paths
        retry
    end
end
print "Create a key\n=> "
key = gets.chomp
b64 = AES.encrypt("heyheywhatsup", key)
puts AES.decrypt(b64, key)
