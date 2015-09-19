def loopy(loops,mutx)
numbs = []
	(0..loops).each do |i|
		numbs.push(i)
	end
	return numbs
end

##
#numbs = []
#i=0
#	while i<=loops
#		#puts "At the top i is #{i}"
#		numbs.push(i*mutx)
#		i += 1
#		#puts "Numbers now: ", numbs
#		#puts "At the top i is #{i}"
#	end
#	return numbs
#end

i = $stdin.gets.chomp.to_i
by = 3

puts "The numbers: "

numbers = loopy(i, by)

# you can write this in 2 ways:
numbers.each {|num| puts num}
