#10/10/2014
require './helps.rb'

class Player
  
  #attr_accessor lets you read/write the object variable
  attr_accessor :name
  attr_accessor :health
  attr_accessor :attack
  attr_accessor :coins
  attr_accessor :weapon
  attr_accessor :typePotion
  attr_accessor :potion
  attr_accessor :thePot
  
  #initial values for player
  def initialize(name)
    @name = name
    @health = 10
    @attack = 1
    @coins = 0
    @weapon = nil
    @typePotion = 0 #Text saying the potion '1 Large potion'
	@thePot = nil #object of potion class Potion. potStr is potion str variable
	@potion = 0 #Do you have a potion?
	
	
  end
  
  #Modify number of coins
  #No less than 0
  def getCoin(coinAmount)
    @coins += coinAmount
  end
  
  #Get better weapon only
  #Display discard on screen if weapon is worse
  def getWeapon()
  end
  
  def usePotion()
    if @potion == 1
	  healthChange(@thePot.potStr)
	  #puts "You have gained #{@thePot.potStr} health."
	  @potion = 0
	  #@thePot = Potion.new(
	else
	  print "You have no potions."
	end
  end
  
  #Modify health, no more than 10, if 0 then death
  def healthChange(amount)
    @health += amount
	if amount > 0
	  puts "You have gained #{amount} health."
	else
	  puts "You have lost #{amount} health."
	end
	
	if @health > 10
	  @health = 10
	end
	
	if @health < 1
	  return(1)
	end 
	  return(0)
	 
  end
 
  
  #display all the character info
  def getInfo()
    puts "--------------------"
	puts "-----Character------"
	puts "--------------------"
    puts @name
	puts "       Health: %s" % @health
	puts "       Attack: %s" % @attack
	puts "        Coins: %s" % @coins
	puts "      Potions: %s" % @typePotion
	puts "       Weapon: %s" % @weapon
    puts "--------------------"
  end
  
end

class Coin
  def initialize(playerObj, mult)
    x = rand(1..100)*mult
    puts "%s coins in chest!" % x
	playerObj.getCoin(x)
  end
  
end

class Weapon
  def initialize(playerObj)
    puts "Trash in chest"
	
  end
end

class Potion
  attr_accessor :potStr
  @@potMap = {'None' => 0,'Small' => 1, 'Medium' => 3, 'Large' => 5}
  @potStr = 0
  
  def initialize(playerObj, potSize)
    if potSize != 'None'
	  puts "You have gained a #{potSize} potion."
	  playerObj.potion = 1
	  playerObj.typePotion = "1 #{potSize} Potion.";
	else 
	  playerObj.potion = 0
	  playerObj.typePotion = "0";	
	end
	  @potStr = @@potMap[potSize]
  end

end

class Monster

  @@monMap = {'Small' => (2..4), 'Medium' => (4..6), 'Large' => (6..8)}
  @monStr = 0

  def initialize(playerObj, monSize)
    puts "You have encountered a #{monSize} monster."
	@monStr = rand(@@monMap[monSize])
	playerObj.healthChange(-@monStr)
  end
end

class SmallChest

  def openChest(playerObj)
    @x = rand(0..3)
    if @x == 0
	  @itemChest = Coin.new(playerObj,1)
	elsif @x == 1
	  @itemChest = Weapon.new(playerObj)
	elsif @x == 2
      if playerObj.thePot.potStr >= 2
	    puts "The chest contained a Small Potion."
		puts "But you already have a stronger one."
      else
	    playerObj.thePot = Potion.new(playerObj, 'Small')
	  end
	elsif @x == 3
	  @itemChest = Monster.new(playerObj, 'Small')
	else
	  @newChest = nil
	end
  end
  
  def identifyChest()
    return "small chest"
  end
end

class MedChest
  
  def openChest(playerObj)
    @x = rand(0..3)
    if @x == 0
	  @itemChest = Coin.new(playerObj,2)
	elsif @x == 1
	  @itemChest = Weapon.new(playerObj)
	elsif @x == 2
      if playerObj.thePot.potStr >= 4
	    puts "The chest contained a Medium Potion."
		puts "But you already have a stronger one."
      else
	    playerObj.thePot = Potion.new(playerObj, 'Medium')
	  end
	elsif @x == 3
	  @itemChest = Monster.new(playerObj, 'Medium')
	else
	  @newChest = nil
	end
  end
  
  def identifyChest()
    return "medium chest"
  end
end

class LargeChest
  
  def openChest(playerObj)
    @x = rand(0..3)
    if @x == 0
	  @itemChest = Coin.new(playerObj,4)
	elsif @x == 1
	  @itemChest = Weapon.new(playerObj)
	elsif @x == 2
      if playerObj.thePot.potStr >= 6
	    puts "The chest contained a Large Potion."
		puts "But you already have a stronger one."
      else
	    playerObj.thePot = Potion.new(playerObj, 'Large')
	  end
	elsif @x == 3
	  @itemChest = Monster.new(playerObj, 'Large')
	else
	  @newChest = nil
	end
  end
  
  def identifyChest()
    return "large chest"
  end
end

#this will create object for a chest when encountered
class Chest
  attr_accessor :chestType
  attr_accessor :newChest

  #assign random digit which will determine size of chest
  def initialize()
    @x = rand(0..2)
    if @x == 0
	  @newChest = SmallChest.new()
	elsif @x == 1
	  @newChest = MedChest.new()
	elsif @x == 2
	  @newChest = LargeChest.new()
	else
	  @newChest = nil
	end
  end
  
  #Open chest, the contents will be determined in child class
  def open(playerObj)
    @newChest.openChest(playerObj)
	#return loot
  end
  
  #Invoke to return text of what size the chest is
  def identify()
    chestType = @newChest.identifyChest
	return chestType
  end
   
end

class Room

  @@roomNumber = 0
  
  def initialize(direction)
    @rmChest = Chest.new()
	@@roomNumber += 1
	@direction = direction
	puts "You enter the #{@direction} room."
    puts "This is room number #{@@roomNumber}"
	puts "There is a #{@rmChest.identify()} in this room."
	#puts @@roomNumber
	#puts @rmChest.identify()
  end
  
  def roomNumber()
    return @@roomNumber
  end
  
  def roomOpenChest(playerObj)
    @rmChest.open(playerObj)
  end

end
#this will control the flow of the game
class Engine

  def initialize(plr)
    @player = plr
	@player.thePot = Potion.new(@player, 'None')
	@isChest = 0
	play()
  end
  
  def play()
	@player.getInfo()
	puts "Hello " + @player.name + ", explore rooms, get coins, don't die."
	puts 'Type "help" at any time to see how to play'
	###WRITE A METHOD TO INVOKE HELP###
	
    puts "====================="
	#puts "---------------------"
	puts "There are two rooms, one to your left, one to your right"


	while @player.health > 0
	  #puts "---------------------"
	  #puts "---------------------"
	  puts "What would you like to do"
	  print "> "
	  @player_choice = $stdin.gets.chomp
	  puts "---------------------"

	
	  if @player_choice == 'left'
	    theRoom = Room.new('left')
		@isChest = 1
	  elsif @player_choice == 'right'
	    theRoom = Room.new('right')
		@isChest = 1
      elsif @player_choice == 'use potion'
	    @player.usePotion()
		@player.thePot = Potion.new(@player, 'None')
	  elsif @player_choice == 'open'
	    if @isChest == 1
	      theRoom.roomOpenChest(@player)
		  @isChest = 0
		else
		  puts "There are no chests left in this room"
		end		
	  elsif @player_choice == 'help'
	    Helps.retHelp()
	  elsif @player_choice == 'stats'
	    @player.getInfo()	
	  else
	    puts "Command not recognized, for a list of commands type 'help'."	
	  end
	
	end
	
	puts "********************************************************************"
	puts "****************************GAME OVER*******************************"
	puts "********************************************************************"
	
	puts "  Rooms visited: #{theRoom.roomNumber}"
	puts "Coins collected: #{@player.coins}"
	
	fileName = "High Scores.txt"
	if File.exist?(fileName)
	  targetFile = open(fileName, "r+")
	  scoreName = targetFile.readline.chomp
	  scoreCoin = targetFile.readline.chomp
	  
	else
	  targetFile = File.open(fileName, 'w')
	  scoreName = "null"
	  scoreCoin = 0
	end
	
	if  @player.coins > scoreCoin.to_i
	  puts "New high score!"
	  targetFile.truncate(0)
	  targetFile.close
	  targetFile =open(fileName, "r+")
	  puts @player.name
	  targetFile.write(@player.name.to_s)
	  targetFile.write("\n")
	  targetFile.write(@player.coins)
	  targetFile.write("\n")
	  puts "High score: "
      puts "#{@player.name} - #{@player.coins} coins"
	  
	else 
    puts "High score: "
	puts "#{scoreName} - #{scoreCoin} coins"	  

	end  
	targetFile.close  
	
	
  end
  
end

##-------------------------------
print"
 ___  ____  __  __  ____  ____  ____      ___    __    __  __  ____ 
/ __)(_  _)(  )(  )(  _ \(_  _)(  _ \    / __)  /__\  (  \/  )( ___)
\__ \  )(   )(__)(  )___/ _)(_  )(_) )  ( (_-. /(__)\  )    (  )__) 
(___/ (__) (______)(__)  (____)(____/    \___/(__)(__)(_/\/\_)(____)
"

print "\n\n Name your character:\n"
print "> "

pName = $stdin.gets.chomp
pObj = Player.new(pName)
theGame = Engine.new(pObj)

print "Thanks for playing \n"

#to do -
#balance % of encounters
#write help method
#in the future if you want, make a battle system