def bubble_sort(unsorted)
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
			if(copy[index] > copy[index + 1])
				sorted = false
				temp = copy[index]
				copy[index] = copy[index + 1]
				copy[index + 1] = temp
			end
		end

		#decrease scope of scan by one 
		sorted_spots += 1
	end

	return copy
end

p bubble_sort([4,3,78,2,0,2])