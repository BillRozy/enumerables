module Enumerable
	def my_each
		for i in 0..self.length-1 do
		yield(self[i])
		end
	end

	def my_each_with_index
		for i in 0..self.length-1 do
		yield(self[i], i)
		end
	end

	def my_select
		array = []
		self.my_each do |element|
		if yield(element) == true
			array.push(element)
		end
		end
		return array
	end

	def my_all?
		count = 0
		self.my_each do |element|
		if yield(element) == false
			count += 1
		end
		end
		if count == 0
		return true
		else
		return false 
		end
	end

	def my_any?
		count = 0
		self.my_each do |element|
		if yield(element) == true
			count += 1
		end
		end
		if count != 0
		return true
		else
		return false 
		end
	end	

	def my_none?
		count = 0
		self.my_each do |element|
		if yield(element) == true
			count += 1
		end
		end
		if count == 0
		return true
		else
		return false 
		end
	end	

	def my_count(num=0)
		count = 0
		if block_given?
		self.my_each do |element|
		if yield(element) == true
			count += 1
		end
		end
		return count
		else
		self.my_each do |element|
		if element == num
			count += 1
		end
		end
		return count
		end
	end	

	def my_map
		array = []
		self.my_each do |element|
		array << yield(element) 
		end
		return array
	end	

	def my_inject(init = 0)
		result = init
		self.my_each do |element|
			result = yield(result,element) 
		end
		return result
	end	
end		

	def multiply_els(array)
		array.my_inject(1) { |product, n| product * n }
	end	


[1,5,3,6,54,234,5].my_each_with_index {|i, c| puts i.to_s + " " + c.to_s}
[1,5,3,6,54,234,5].each_with_index {|i, c| puts i.to_s + " " + c.to_s}
a = [1,5,6,3,9,70,5,2]
print a.select {|v| v > 8 }
print a.my_select {|v| v > 8}
print a.all? {|i| i > 0}
print a.my_all? {|i| i<60}
puts

print a.any? { |i| i ==1}
print a.my_any? {|i| i==1}

puts

print %w{ant bear cat}.none? { |word| word.length == 5 }
print %w{ant bear cat}.my_none? { |word| word.length == 5 }

puts
ary = [1, 2, 4, 2]
print ary.count{ |x| x%2==0 }
print ary.my_count{ |x| x%2==0 }
print ary.my_count(2)

puts

puts [1,2,3,4].map { |i| i*i } 
puts [1,2,3,4].my_map { |i| i*i } 

print [5,6,7,8,9,10].inject { |sum, n| sum + n }  
puts
print [5,6,7,8,9,10].my_inject { |sum, n| sum + n }  

print [5,6,7,8,9,10].my_inject(1) { |product, n| product * n }

puts

 puts multiply_els([2,4,5])