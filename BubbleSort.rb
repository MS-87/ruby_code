#just a quick test module
module BubbleSort
	#bubble sort and return sorted array
	def BubbleSort.sort(arr)
		size = arr.size
		loop do
			x = 0 #conditional variable
			arr[0...-1].each_with_index do |v, i|
				if arr[i] > arr[i+1]
					y = arr[i]
					arr[i] = arr[i+1]
					arr[i+1] = y					
					x = 1
				end
			end
			break if x == 0
		end
		return arr
	end

	#generate new random array of given with optional size arg
	def BubbleSort.generate_new(size = 1+rand(50))
		arr = []
		(0...size).each do |i|
			arr << rand(10)
		end
		return arr
	end
	
end
