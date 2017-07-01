# TODO: based on platform, show
# BUG: can't check for linux or mac

module OS
    def title
        if RUBY_PLATFORM =~ /cygwin|mswin|mingw/
            system "title XCSS"
        end
    end

    def files
        if RUBY_PLATFORM =~ /cygwin|mswin|mingw/
            system "dir"
        elsif RUBY_PLATFORM =~ /darwin/
            system "ls"
        end
    end
end
