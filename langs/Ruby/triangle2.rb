module Enumerable
	def wsample(n)
		self.max_by(n) {|v| rand ** (1.0/yield(v)) }
	end
end

e = (-20..20).to_a*10000
a = e.wsample(20000) {|x| Math.exp(-(x/5.0)**2)}

h = a.group_by {|x| x}
-10.upto(10) {|x| puts '*' (h[x].length/30.0).to_i if h[x]}