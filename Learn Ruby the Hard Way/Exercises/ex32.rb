the_count = [1, 2, 3, 4, 5]
fruits = ['apples', 'oranges', 'pears', 'apricots']
change = [1, 'pennies', 2, 'dimes', 3, 'quarters']

#for loop type 1 - traditional style
for number in the_count
	puts "this is the count #{number}"
end

#Ruby style, preferred
fruits.each do |fruit|
	puts "A fruit of type: #{fruit}"
end

#Mixed lists, different way to write above
change.each {|i| puts "I got #{i}" }


#how to build a list -- start with empty one
elements =[]

#then use the range operator to do 0 to 5 counts
(0..5).each do |i|
	puts "adding #{i} to the list."
	#pushes the i variable on the *end* of the list
	elements.push(i)
end

#and now print them out
elements.each {|i| puts "element was: #{i}" }



	

