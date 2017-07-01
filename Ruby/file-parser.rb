filenames = Dir.glob("*.jpg")
i = 0
filenames.each do |filename|
	File.rename(filename, i.to_i + ".jpg")
	i=+1
end