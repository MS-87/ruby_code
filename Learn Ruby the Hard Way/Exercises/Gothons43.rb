# Base clasee for scene
#This code gives an error code, so this should not be accessed ever?
#class Scene
#  def enter()
#    puts "This scene is not yet configured. Subclass it and implement enter()."
#    exit(1)
#  end
#end

class Engine

  #4 - initialize a_game object, pass to it a_map object of type map
  #@scene_map is now an object type map local to a_game object type engine
  def initialize(scene_map)
    @scene_map = scene_map
  end
  
  #6 - gets called in last line of program, for a_game object
  def play()
	#7 create new variable current_scene
	#7a @scene_map is an object type map, and you call its internal function opening_scene
	
	#11 - current_scene is now an object of type CentralCorridor
    current_scene = @scene_map.opening_scene()
	
	#12 create a new variable last_scene
	#12a for the @scene_map object, invoke the next_scene function, with argument 'finished'
	
	#14 last_scene is now an object of class type Finished
    last_scene = @scene_map.next_scene('finished')

	#15 run this while the two variables defined above are not equal to each other
	#15 in the beginning these variables correspond to two different objects one of CentralCorridor and one Finished
    while current_scene != last_scene
	
	  #16 create variable next_scene_name.
	  #16a - invoke current_scene's enter function, which is CentralCorridor.enter()
	  
	  #18 - the return is a string, 'death', 'finished', or -itself-, which is now contained in next_scene_name
      next_scene_name = current_scene.enter()
	  
	  #19 - call next_scene function for object @scene_map with argument next_scene_name, which now contains the string of the next scene 
	  #the return will be an object of class LaserWeaponArmory() 
      current_scene = @scene_map.next_scene(next_scene_name)
    end

    ### be sure to print out the last scene
    current_scene.enter()
  end
end

class Death# < Scene

  @@quips = [
    "You died.  You kinda suck at this.",
     "Your mom would be proud...if she were smarter.",
     "Such a luser.",
     "I have a small puppy that's better at this."
  ]

  def enter()
    puts @@quips[rand(0..(@@quips.length - 1))]
    exit(1)
  end
end


class CentralCorridor# < Scene

  #17 - this gets invoked
  def enter()
    puts "The Gothons of Planet Percal #25 have invaded your ship and destroyed"
    puts "your entire crew.  You are the last surviving member and your last"
    puts "mission is to get the neutron destruct bomb from the Weapons Armory,"
    puts "put it in the bridge, and blow the ship up after getting into an "
    puts "escape pod."
    puts "\n"
    puts "You're running down the central corridor to the Weapons Armory when"
    puts "a Gothon jumps out, red scaly skin, dark grimy teeth, and evil clown costume"
    puts "flowing around his hate filled body.  He's blocking the door to the"
    puts "Armory and about to pull a weapon to blast you."
    print "> "
	
    #17a - get input from user
    action = $stdin.gets.chomp
    
	#17b - if statements, related to input
    if action == "shoot!"
      puts "Quick on the draw you yank out your blaster and fire it at the Gothon."
      puts "His clown costume is flowing and moving around his body, which throws"
      puts "off your aim.  Your laser hits his costume but misses him entirely.  This"
      puts "completely ruins his brand new costume his mother bought him, which"
      puts "makes him fly into an insane rage and blast you repeatedly in the face until"
      puts "you are dead.  Then he eats you."
      return 'death'

    elsif action == "dodge!"
      puts "Like a world class boxer you dodge, weave, slip and slide right"
      puts "as the Gothon's blaster cranks a laser past your head."
      puts "In the middle of your artful dodge your foot slips and you"
      puts "bang your head on the metal wall and pass out."
      puts "You wake up shortly after only to die as the Gothon stomps on"
      puts "your head and eats you."
      return 'death'

    elsif action == "tell a joke"
      puts "Lucky for you they made you learn Gothon insults in the academy."
      puts "You tell the one Gothon joke you know:"
      puts "Lbhe zbgure vf fb sng, jura fur fvgf nebhaq gur ubhfr, fur fvgf nebhaq gur ubhfr."
      puts "The Gothon stops, tries not to laugh, then busts out laughing and can't move."
      puts "While he's laughing you run up and shoot him square in the head"
      puts "putting him down, then jump through the Weapon Armory door."
      return 'laser_weapon_armory'

    else
      puts "DOES NOT COMPUTE!"
      return 'central_corridor'
	  
	#17c here there are 3 things that can be returned 'death', 'laser_weapon_armory', and 'central_cooridor'
	#this is a string that is returned back up inside the Engine class
    end
  end
end

class LaserWeaponArmory# < Scene

  def enter()
    puts "You do a dive roll into the Weapon Armory, crouch and scan the room"
    puts "for more Gothons that might be hiding.  It's dead quiet, too quiet."
    puts "You stand up and run to the far side of the room and find the"
    puts "neutron bomb in its container.  There's a keypad lock on the box"
    puts "and you need the code to get the bomb out.  If you get the code"
    puts "wrong 10 times then the lock closes forever and you can't"
    puts "get the bomb.  The code is 3 digits."
    code = "#{rand(1..9)}#{rand(1..9)}#{rand(1..9)}"
    print "[keypad]> "
    guess = $stdin.gets.chomp
    guesses = 0

    while guess != code && guesses < 10
	  puts code
      puts "BZZZZEDDD!"
      guesses += 1
      print "[keypad]> "
      guess = $stdin.gets.chomp
    end

    if guess == code
        puts "The container clicks open and the seal breaks, letting gas out."
        puts "You grab the neutron bomb and run as fast as you can to the"
        puts "bridge where you must place it in the right spot."
        return 'the_bridge'
    else
        puts "The lock buzzes one last time and then you hear a sickening"
        puts "melting sound as the mechanism is fused together."
        puts "You decide to sit there, and finally the Gothons blow up the"
        puts "ship from their ship and you die."
        return 'death'
    end
  end
end

class TheBridge# < Scene

  def enter()
    puts "You burst onto the Bridge with the netron destruct bomb"
    puts "under your arm and surprise 5 Gothons who are trying to"
    puts "take control of the ship.  Each of them has an even uglier"
    puts "clown costume than the last.  They haven't pulled their"
    puts "weapons out yet, as they see the active bomb under your"
    puts "arm and don't want to set it off."
    print "> "

    action = $stdin.gets.chomp

    if action == "throw the bomb"
      puts "In a panic you throw the bomb at the group of Gothons"
      puts "and make a leap for the door.  Right as you drop it a"
      puts "Gothon shoots you right in the back killing you."
      puts "As you die you see another Gothon frantically try to disarm"
      puts "the bomb. You die knowing they will probably blow up when"
      puts "it goes off."
      return 'death'

    elsif action == "slowly place the bomb"
      puts "You point your blaster at the bomb under your arm"
      puts "and the Gothons put their hands up and start to sweat."
      puts "You inch backward to the door, open it, and then carefully"
      puts "place the bomb on the floor, pointing your blaster at it."
      puts "You then jump back through the door, punch the close button"
      puts "and blast the lock so the Gothons can't get out."
      puts "Now that the bomb is placed you run to the escape pod to"
      puts "get off this tin can."
      return 'escape_pod'
    else
      puts "DOES NOT COMPUTE!"
      return "the_bridge"
    end
  end
end

class EscapePod# < Scene

  def enter()
    puts "You rush through the ship desperately trying to make it to"
    puts "the escape pod before the whole ship explodes.  It seems like"
    puts "hardly any Gothons are on the ship, so your run is clear of"
    puts "interference.  You get to the chamber with the escape pods, and"
    puts "now need to pick one to take.  Some of them could be damaged"
    puts "but you don't have time to look.  There's 5 pods, which one"
    puts "do you take?"

    good_pod = rand(1..5)
	print good_pod
    print "[pod #]> "
    guess = $stdin.gets.chomp.to_i
	

    if guess != good_pod
      puts "You jump into pod %s and hit the eject button." % guess
      puts "The pod escapes out into the void of space, then"
      puts "implodes as the hull ruptures, crushing your body"
      puts "into jam jelly."
      return 'death'
    else
      puts "You jump into pod %s and hit the eject button." % guess
      puts "The pod easily slides out into space heading to"
      puts "the planet below.  As it flies to the planet, you look"
      puts "back and see your ship implode then explode like a"
      puts "bright star, taking out the Gothon ship at the same"
      puts "time.  You won!"


      return 'finished'
    end
  end
end

class Finished# < Scene
  def enter()
    puts "You won! Good job."
  end
end

class Map

  #2a - newly created a_map object has this hash of scene functions indexed by the text of the scene
  @@scenes = {
    'central_corridor' => CentralCorridor.new(),
    'laser_weapon_armory' => LaserWeaponArmory.new(),
    'the_bridge' => TheBridge.new(),
    'escape_pod' => EscapePod.new(),
    'death' => Death.new(),
    'finished' => Finished.new(),
  }

  #2 - newly created a_map object has a local variable called @start_scene, 'central_corridor' loaded to it
  #@start_scene is a string
  def initialize(start_scene)
    @start_scene = start_scene
  end

  #9 - 'central corridor' is passed here. val is assigned the value of the @@scenes hash at index 'central_corridor'
  # the return is CentralCorridor.new(), so a new object called val is created of object type CentralCorridor (see 9a) 
  #there is no initiate() function, therefore the object ONLY has 1 item in it, and it is a function called enter()
  
  #13 - 'finished' is passed here, which is the index for Finished.new(), new object is returned back
  
  #20 - lets say 'laser_weapon_aromry was passed' was passed here again
  def next_scene(scene_name)
    val = @@scenes[scene_name]
    return val
  end

  #8 - this function gets called for the object @scene_map of class type map
  def opening_scene()
  #8a - call the next_scene function internal to map objects, pass to it (@start_scene)
  # at this point start_scene contains the string 'central_corridor' passed in step #1
  # the object invoking these functions is still @scene_map which is a clone of a_map
  # therefore it'll have the same values, which is why @start_scene == 'central_corridor'
  
  #10 - here, the return of opening_scene is the return of next_scene, which has a value of CentralCorridor.new()
    return next_scene(@start_scene)
  end
end

#1 - Create an object of type Map, pass to it 'central_corridor'
a_map = Map.new('central_corridor')

#3 - create an object a_game type engine, with argument object "a_map" passed to it
a_game = Engine.new(a_map)

#5 - call the play() function within a_game object of class engine
a_game.play()