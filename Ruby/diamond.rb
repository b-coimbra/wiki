space = " "
space_count = 4
7.times do |row|
	if row < 4
		space_count -= 1
		start_count = row * 2 + 1
		print space * space_count
	else
		space_count += 1
		start_count = (7 - 1 - row) * 2 + 1
		print space * space_count
	end
	puts '*' * start_count
end