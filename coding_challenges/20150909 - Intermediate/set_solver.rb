class SetGame
	#Individual set card structure with all 4 attributes
	SetCard = Struct.new(:shape, :color, :number, :shade, :name)

	def initialize(cards)
		@set_cards = []
		@sets = []
		cards.each do |i|
			arr = i.split("")
			@set_cards << SetCard.new(arr[0],arr[1],arr[2],arr[3],i)
		end
	end

	def find_sets
		#Iterate through every card combination
		@set_cards[0..-3].each_with_index do |v1, i|
			@set_cards[i+1..-2].each_with_index do |v2, i2|
				@set_cards[i+i2+1..-1].each do |v3|
					if valid_set?(v1,v2,v3)
						arr = [v1[:name],v2[:name],v3[:name]]
						@sets << arr
					end
				end
			end
		end
		print_sets
	end

	private
		def valid_set?(v1, v2, v3)

			#terrible code, research easier way to do this
			if ((v1[:shape] == v2[:shape] and v2[:shape] == v3[:shape]) or (v1[:shape] != v2[:shape] and v2[:shape] != v3[:shape] and v1[:shape] != v3[:shape]))
				if ((v1[:color] == v2[:color] and v2[:color] == v3[:color]) or (v1[:color] != v2[:color] and v2[:color] != v3[:color] and v1[:color] != v3[:color]))
					if ((v1[:number] == v2[:number] and v2[:number] == v3[:number]) or (v1[:number] != v2[:number] and v2[:number] != v3[:number] and v1[:number] != v3[:number]))
						if ((v1[:shade] == v2[:shade] and v2[:shade] == v3[:shade]) or (v1[:shade] != v2[:shade] and v2[:shade] != v3[:shade] and v1[:shade] != v3[:shade]))
							return true
						end
					end
				end
			end
			return false
		end

		def print_sets
			puts "Valid sets:"
			@sets.each_with_index {|v,i| print @sets[i].join(" "), "\n"}
			puts
		end

end

#Example Input
gameboard1 = <<CARDIN
SP3F
DP3O
DR2F
SP3H
DG3O
SR1H
SG2O
SP1F
SP3O
OR3O
OR3H
OR2H
CARDIN

puts "Game 1"
cards1 = gameboard1.split("\n")
game1 = SetGame.new(cards1)
game1.find_sets

#Challenge Input
gameboard2 = <<CARDIN
DP2H
DP1F
SR2F
SP1O
OG3F
SP3H
OR2O
SG3O
DG2H
DR2H
DR1O
DR3O
CARDIN

puts "Game 2"
cards2 = gameboard2.split("\n")
game2 = SetGame.new(cards2)
game2.find_sets



