#!/usr/bin/env ruby
->(i) {->(_) {Dir[$_=(_.nil? ? '.' : _) + '/*'].each_with_index {|f,i| f.to_enum(:scan, /(?<type>\.(png|jpg|jpeg|gif|webm|mp4|pdf))$/im). \
    map {p "[#{-~i}/#{Dir["#{_}/*"].length}] "+f;$_=f; test(?e, ($_) + i.to_s + $1) ? next : \
    File.rename(f, File.dirname(f) + File::SEPARATOR + (-~i).to_s + $~[:type])}}} \
    ::(ARGV[0])}.(0) && at_exit {system "echo Done! && explorer #{$_.gsub(/\/[(\w|\d)\.\w\d]+$/i,'')}"} \
    rescue Errno::EACCESS abort "Cant sort this folder :("