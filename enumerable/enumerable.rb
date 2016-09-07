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

	def my_map
		mapped = []
		self.my_each do |value|
			mapped << yield(value)
		end
		return mapped
	end

end