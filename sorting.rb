#can only accept numerical values
def bubble_sort(unsorted)
	bubble_sort_by(unsorted) {|first, second| second - first}
end

def bubble_sort_by(unsorted)
	#validate unsorted is an array
	error = "Wrong Argument Error: This function accepts an array of unsorted objects as input."
	return error unless unsorted.is_a?(Array)

	copy = unsorted
	sorted = false
	#shorten scope of sort with each pass of the loop (i.e. ignore last spot, then next last...)
	sorted_spots = 0
	
	until(sorted)
		sorted = true
		#calc scope of scan. it is the size of the array, adjusted to index at 0,
		#adjusted for the spots at the end of the array that by definition hold sorted values
		scope_of_scan = copy.size - 1 - sorted_spots
		
		#compare each value to next value until a full pass is completed with no out of place elements
		scope_of_scan.times do |index|
			#will trigger if the yeild block results in a positive number
			if(yield(copy[index], copy[index + 1])) > 0
				sorted = false
				copy[index], copy[index+1] = copy[index+1], copy[index]
			end
		end

		#decrease scope of scan by one 
		sorted_spots += 1
	end

	return copy
end

#testing
p (bubble_sort_by(["hi","hello","hey"]) do |left,right|
	left.length - right.length 
end)