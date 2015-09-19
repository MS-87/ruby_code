class Song  #Defining the class
	
	def initialize(lyrics) #initialize function, first thing it does upon instantiation
		@lyrics = lyrics # @ means for this object, so receive (lyrics) upon instantiation, nad create @lyrics
	end
	
	def sing_me_a_song()
		@lyrics.each {|line| puts line}
	end
end


#happy bday is an object created of class Song. 
#a 3 element array with the song gets sent to lyrics upon instantiating
happy_bday = Song.new(["Happy birthday to you", 
			"I don't want to get sued", 
			"So i'll jost stop right there"]) 
		
bulls_on_parade = Song.new(["They rally around the family",
			"with pockets full of shells"])

			
#sing_me_a_song function gets called, which just prints every line
happy_bday.sing_me_a_song()
bulls_on_parade.sing_me_a_song()