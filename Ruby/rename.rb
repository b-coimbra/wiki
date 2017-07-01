id = rand(0..5000)
filenames = Dir.glob("*.gif")
filenames.each do |filename|
	File.rename(filename, id.to_s + ".gif")
	id += 1
end