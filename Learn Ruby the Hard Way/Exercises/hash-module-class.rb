#Three ways of getting things from things:

#hash style
mystuff['apples'] #this getting value stored in keyword apples, for hash mystuff

#module style
MyStuff.apples() #MyStuff is the module, apples is the function in the module
puts MyStuff::Tangerine #This :: lets you access a variable (inside MyStuff) instead of a funciton

# Class Style
thing = MyStuff.new() #.new is the command to instanciate the class to create an object (object is thing)
thing.apples() #access the .apples() function native inside thing
puts thing.tangerine #access the tangerine variable native inside thing

