module Enumerable
	def my_each
		for i in 0..self.length do
		yield(self[i])
		end
	end

	def my_each_with_index
		for i in 0..self.length do
		yield(self[i], i)
		end
	end
end		



[1,5,3,6,54,234,5].my_each_with_index {|i, c| puts i.to_s + " " + c.to_s}
[1,5,3,6,54,234,5].each_with_index {|i, c| puts i.to_s + " " + c.to_s}