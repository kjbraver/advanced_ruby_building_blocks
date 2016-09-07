module Enumerable 
	def my_each
		for item in self
			yield(item)
		end
		return self
	end

	def my_each_with_index
		index = 0
		for item in self
			yield(item, index)
			index += 1
		end 
	end

	def my_select
		selection = []
		self.my_each do |value|
			selection << value if yield(value) 
		end
		return selection
	end

	def my_all?
		self.my_each do |value|
			return false if !yield(value)
		end
		return true
	end

	def my_any?
		self.my_each do |value|
			return true if yield(value)
		end
		return false
	end

	def my_none?
		self.my_each do |value|
			return false if yield(value)
		end
		return true
	end

	def my_count
		count = 0
		self.my_each do |value|
			if(block_given?)
				count += 1 if yield(value)
			else
				count += 1
			end
		end
		return count 
	end

	def my_map(instructions=nil)
		mapped = []
		self.my_each do |value|
			mapped << yield(value) if instructions.nil?
			mapped << instructions.call(value) if !instructions.nil?
		end
		return mapped
	end

	def my_inject(initial=nil, instructions=nil) 
		data = self.to_a
		total = 0
			if(initial.nil?)
				total = data[0]
				if(instructions.nil?) 
					data.drop(1).my_each {|value| total = yield(total, value)} 
				else
					data.drop(1).my_each {|value| total = instructions.call(total, value)}
				end
			else
				total = initial
				if(instructions.nil?) 
					data.my_each {|value| total = yield(total, value)} 
				else
					data.my_each {|value| total = instructions.call(total, value)}
				end
			end
		return total
	end
end

def multiply_els(numbers)
	numbers.my_inject(1) {|product, num| product * num}
end