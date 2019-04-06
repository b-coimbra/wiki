# require gems, installs dependencies
def __import__(*lib)
   lib.each do |i|
      begin
         require i
      rescue LoadError
         system "gem install #{i}"
         Gem.clear_paths
         retry
      end
   end
end

# USAGE:
__import__("eat", "nokogiri", "sass", "bundler")