##Hashing arrays

#create array with hashing
stuff = {'name' => 'Ned', 'age' => 39, 'height' => 6*12+2}

puts stuff ['name']
puts stuff['age']
puts stuff['height']

#you can add hashes later
stuff['city'] = "San Francisco"
print stuff['city']

#you can later add number indexes to an array which get pushed to the end
stuff[1] = "wow"

#or delete stuff
stuff.delete('name')

puts stuff