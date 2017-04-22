require "./functions.rb"
# => I want to 'type' everything out!
require "./typewriter.rb"

class Scene
	#I want to set a new typewriter instance for each scene
	@@t = Typewriter.new('very_fast')

	def enter()
		puts "This is the base scene class. This should not be showing up at all, so make sure\n"\
		"tat the cave mouth is everything that you need within the other classes"
	rescue
		exit(1)
	end
end

class Death < Scene

	#For each area, I want different types of deaths.
	@@death_scene_hash = {
		'cave_mouth' => ["You really shouldn't have died at the cave mouth...",
						"How the hell did you even die at the cave mouth?"],
		'dream_return' => ["Wow, that sounds like it hurt. Good thing it's not real life, huh?",
						"The monster had your flesh for dinner. That's pretty cool, tell your friends!"],
		'inn' => ["The bartender taks no time in leaping over the bar and beating your face in to a pulp.\n"\
			"You die on the floor of the bar\n"\
			"But, your death exposes the bartender's extreme anger problem to his family, and local community.\n"\
			"He commits suicide after he loses his business and gets divorced",
			"Dang, you got messed the fuck up homie."],
		'barracks_1' => nil,
		'barracks_2' => nil,
		'hallway_1' => nil,
		'hallway_2' => nil,
		'hallway_3' => nil,
		'hallway_4' => nil,
		'hallway_5' => nil,
		'hallway_6' => nil,
		'antechamber' => nil,
		'kitchen' => nil,
		'dining_room' => nil,
		'servants_dining_room' => nil,
		'servants_quarters' => nil,
		'entertainment_room' => nil,
		'pleasure_room' => nil,
		'master_bedroom' => nil,
		'bathroom' => nil,
		'spiral_staircase' => ["The gargoyle grabs the back of your collared shirt.\n"\
								"You try for your life to claw at his arm, hoping for the chance to "\
								"wrest his grip from you.\nSadly, you can't and, using all his strength"\
								"the gargoyle throws you off the stairs into the dark abyss below.\n"\
								"You don't even hear the 'splat' that your body makes on the floor before you die..."]
	}

	def initialize(scene_of_death = nil)
		#Input the scene_of_death within each death callout. Or don't.
		@scene_of_death = scene_of_death
	end

	def enter()
		if !@scene_of_death
			@@t.type("\nWow.... You died....\n")
		else
			#Randomize the type of death within the area death scenes!
			@@t.type("\n" + @@death_scene_hash[@scene_of_death][rand(0...@@death_scene_hash[@scene_of_death].length)] + "\n")
		end
		exit(1)
	end
end


#--------------------------------Village Scenes------------------------------------#
class Dream < Scene
	def initialize(return_to_sleep = false)
		@return_to_sleep = return_to_sleep
	end

	def enter()
		if @return_to_sleep
			@@t.type("You return to the black room you were in before in the same situation that you left it. The only difference is that you get to feel\n"\
				"all the pain, in great detail, that you only quickly felt before as an unknown... monster (?) eats you limb by limb.")
			#agh, I don't know how I'm going to get these deaths to workkkk!!!!
			return "death(dream_return)"
		else
			@@t.type("\tYour eyes open, but you can't see anything; nothing but pitch blackness surrounds you wherever you look.\n"\
				"Fear starts to grow inside your stomach. You can hear something, it sounds like the\n"\
				"whistle of wind going very fast, but you get a feeling of complete and utter stillness around you.\n"\
				"Quickly, you reach for your pocket and pull out your bronzed lighter, flick it open, and light it up.\n"\
				"For a second there you thought you might have been blind, but the steady flame comforts your mind.\n"\
				"You reach down to the ground to brace yourself, and as you stand up, you suddenly feel\nthat you were sitting in at least a foot deep of water\n"\
				"How didn't you notice it before?")
			@@t.change_speed('very_slow')
			@@t.type(".\n.\n.\n.")
			@@t.change_speed('very_fast')
			@@t.type("'HELLOOOOOOOOOOOOO!!!', you call out to the darkness around you. Nothing stirs past the sound of the wind.\n"\
				"You start walking with the lighter in your hand\n"\
				"Time passes for what seems like forever as you search for an exit.... light... anything\n"\
				"Tears well up in your eyes as you notice your situation becoming more and more hopeless.\n"\
				"What are you going to do for food, for water?\n"\
				"It has become too much.\n"\
				"You stop in your tracks, bend down, and hug your knees to your chest as you start sobbing into them\n"\
				"'What did I do to deserve this hell?', you think to yourself as warm tears roll down your face. You can taste salt as you breathe in.\n"\
				"You stop sobbing almost as fast as you started when you notice that you can't hear ANYTHING anymore.\n"\
				"'Hello?', you weakly call out. You are answered with a rumbling growl, more menacing than anything you can think of. It sounds so close...\n"\
				"A gust of wind swiftly passes over your shoulder, and your lighter immediately goes out.\n"\
				"You try striking the flint again and again, over and over, but the flame doesn't come back.\n"\
				"Completely resigned, you drop the lighter into the water, drop down, and start sobbing again\n"\
				"Unable to see anything, your heightened sense of awareness alerts you of something right above you\n"\
				"but you don't care. you resign yourself completely. Absolute pain stabs through your neck and your torso\n"\
				"you taste blood in your mouth as you pray for a quick death...\n\n\n")
			sleep(5)
			return "inn-bedroom(basic)"
		end
	end
end

class Inn < Scene
	def initialize(kicked_out = false, returned = false)
		@kicked_out = kicked_out
		@returned = returned
	end

	def enter()
		if @kicked_out
			return "death(inn)"
		elsif @returned && !@kicked_out
			@@t.type("\tThe bartender greets you again as you go up to the bar table.\n"\
				"'Oh, I didn\'t think that you would come back so soon, you looked pretty distraught... Here, I can tell\n"\
				"\tthat you're not feeling well. Have a beer on the house!'\n"\
				"The bartender slides a beer down to you after he finishes pouring it. The momentum throws beeer out of the\n"\
				"mug and on to your hand as you catch it. You don't care, though. You guzzle the beer down as fast as you can, hoping\n"\
				"that it will make you feel better, and it does! You feel the want for another beer,\n"\
				"but you know that you should also figure out how to get out of this place\n"\
				"and tell your boss where you are.")
			choices = ["Drink another beer", "Go back outside to try and get some service"]
			choice = list_choices(choices)
			if choice == 1
				@@t.type("You order another beer, and then another one after that... and then another one after that... you eventually\n"\
					"black out.")
				@@t.change_speed('very_slow')
				@@t.type(".\n.\n.\n.")
				@@t.change_speed('very_fast')
				return "whorehouse-room(drunk-enter)"
			else
				return "outside-inn(returned)"
			end
		else
			@@t.type("\tThe Inn's stairs go down into a nice little dining area\n"\
				"It is filled with medium sized circular tables that have pretty plain wooden chairs around them\n"\
				"As your foot gets off the last step, the bartender sees you and waves at you\n"\
				"'Hello!', he says, very sincerely. 'You went to bed real late last night, I don't know how you're up so early!'\n"\
				"You don't remember much from last night except that the house-ale was brilliant.\n"\
				"Maybe that's why you had such a bad dream... And the pain you felt when you woke up could've been a headache...\n"\
				"'Haha, yeah, well I usually operate on only a couple hours of sleep nowadays... And the beer you serve is so good!\n"\
				"'What the hell do you put in that stuff?', you ask.\n"\
				"'Family secret,' he winks at you.")
			choices = ["Forcefully ask: 'No really, what\'s the secret...'", "Laugh"]
			choice = list_choices(choices)
			if choice == 1
				@@t.type("The bartender looks at you like you're a crazy person. His face grows red, and his lips become tighter together\n"\
					"He points a big index finger at you. 'Get out. Now.', he says.")
				choices_2 = ["'Fuck you, old man. I paid for my room, and I'm going to be here for five more days!'",
					"You internally gasp, and can't think of anything to say to make this situation better.\n"\
					"You go up to your room, grab your stuff, and head out the door with your hat hiding your eyes..."]
				choice_2 = list_choices(choices_2)
				if choice_2 == 1
					return "death(inn)"
				else
					return "outside-inn(kicked-out)"
				end
			else
				@@t.type("The bartender laughs with you. 'So, where are you going to be headed to Mr.?', he asks\n"\
					"You pause a second 'Oh, um... The Hinman building!', you say. The bartender looks at you perplexed\n"\
					"'What\'s wrong?', you ask the bartender.\n"\
					"'Well, I've never heard of that place before. I've got the second real business in this town... The other\n"\
					"\tone in this town is an inn as well...', he says, resigned.\n"\
					"'Wait, what? This isn't a town! It's a city! right? This is \n"\
					"'\'Fraid not, sir. You're in Blount County, Alabama.\n"\
					"Your jaw drops. Last night you remember that you were in a town near Saint Louis, Missouri for your big meeting\n"\
					"'Please tell me you're kidding, sir,' you plead with the bartender\n"\
					"'I don't know what to tell ya. This is Blount County. I'm sure of it, 100%! Lived here all my life\n"\
					"Your cover your face with your hands in exasperation. 'What the fuck am I gonna do?', you ask yourself\n"\
					"You take out your phone to call your boss. When you look at it, you see you have no service.\n"\
					"'fucking piece OF SHIT', you yell, as you throw your phone across the room.")
			end
		end
	end
end

class InnBedroom < Inn
	def enter()
		@@t.type("\tYou jolt awake breathing very heavily, sit up, and feel the back of your neck.\n"\
			"It is still painful, but when you put your hand in front of your face to check, you see no blood\n"\
			"A huge sigh comes out of your mouth as you fall back down on the bed, smashing your head into the soft pillow\n"\
			"'What the hell kind of dream was that?', you ask yourself as you wipe the beaded sweat from your forehead\n"\
			"You throw the covers off, and are surprised to see that you are completely naked.\nYou haven't slept without clothes in years...\n"\
			"Your legs swing off the bed and down onto the floor, and you stand up to go to the bathroom.\nIt feels exceptionally hard"\
			"to get out of bed\nyou feel like you didn't sleep for any amount of time at all...\n"\
			"Time passes by fast as you get ready for the day.\n"\
			"When you get completely dressed, you look at the time and realize that you have a TON of extra time to get to your meeting\n"\
			"What do you do?")
		choices = ["Go Downstairs", "Go Back to Sleep"]
		choice = list_choices(choices)
		if choice == 1
			#Player goes down to the inn's dinng area
			return "inn(basic)"
		else
			#Player goes back to sleep, and then dies.
			return "dream(return)"
		end
	end
end

class OutsideInn < Scene
	def initialize(kicked_out = false, returned = false)
		#Returned is if the player goes back in the inn for any reason. Kicked out is if the player gets kicked out, and then basic
		# => is if the player talks to the bartender, learns what he says, and goes back outside.
		@kicked_out = kicked_out
		@returned = returned
	end

	def enter()
		if @returned
			@@t.type("\tYou are outside, nothing has changed since the last time you were out here.")
		elsif @kicked_out
			@@t.type("Dang, you got kicked out!")
		else
			@@t.type("Going outside the inn for the first time.")
		end
		puts "\n"
		@@t.type("What do you do?")
		choices = ["Go back inside the inn. You're scared.", "Explore", "Search for directions to Harrow's Cave"]
		choice = list_choices(choices)
		if choice == 1 and !@kicked_out
			return "inn(returned)"
		elsif choice == 1 and @kicked_out
			return "inn(kicked-out)"
		elsif choice == 2
			@@t.type("You are now exploring the oustide of the little town that you happen to be in")
		else 
			@@t.type("You evntually meet a person who gives you directions to the cave! Yay!!!")
		end
	end
end

class Whorehouse < Scene
	def initialize(drunk_enter = false, after_sex_enter = false)
		@drunk_enter = drunk_enter
		@after_sex_enter = after_sex_enter
	end

	def enter()
		if @drunk_enter
			@@t.type("You get down to the lobby, still in a haze. You will never ever drink again, you tell yourself.\n"\
				"While you're going down the steps, you spot a very beautiful older lady working at a very ornate wooden desk\n"\
				"'Sylvia!', Cassandra calls out. 'I want you to meet this guy! He has been the best customer I've been with since I got here!\n"\
				"\tHe actually asked me a question after we had sex!\n\n"\
				"Sylvia looks up from her work. 'Oh, well isn't that just the nicest thing ever!!! Thank you so much for showing our lovely\n"\
				"\tCassandra here a nice time!\n"\
				"'Now please, come back again if you ever want to have any more fun! We've been dying to have some newer customers lately\n")
			@@t.type("'No problem', you say slyly, a you embrace your coat harder, and head outside. You still have to find that cave...you know... for the \n"\
				"\tcellphone reception... Yeah.....")
			return "outside(whorehouse)"
		elsif @after_sex_enter
			@@t.type("You get down to the lobby, breathe heavily as you reach the last step, and look to see a very attractive older lady\n"\
				"\tworking on paperwork on a very ornate wooden desk\n"\
				"She looks up to you as you pass, and nods her head as you head outside")
			return "outside(whorehouse)"
		else
			@@t.type("this is if the player goes to the whorehouse of their own will!")
		end
	end
end

class WhorehouseRoom < Whorehouse
	def initialize(drunk_enter = false)
		super
	end

	def enter()
		if @drunk_enter
			@@t.type("You wake up in a really comfy bed with a headache the size of manhattan. You immediately know that you're not\n"\
				"in your room at the inn, because the bed you were sleeping in was not half as comfy as the one you're in now. You start to\n"\
				"get up when your hand brushes what feels like skin under the covers, you look to your side and see an absolutely\n"\
				"beautiful person laying next to you, and they're naked!\n"\
				"You know for sure that's not the person you're married to back at home,\n"\
				"and guilt washes over you for just a second, and then the need to puke.\n"\
				"You start to get up to go to the bathroom, but you notice that there is a bucket with some puke in it already\n"\
				"'Oh wow, I got so drunk I didn't even know I puked before...'. You puke heartily into the bucket.\n"\
				"The stirring next to you signals that the person next to you woke up.\n"\
				"After you wipe the puke from your lips with a kleenex, you turn around and are dumbfounded by their beauty.\n"\
				"They are looking into your eyes while smiling. 'Good morning, sunshine! You sure had a wild night\n"\
				"\tlast night, huh?', they say you to sympathetically.\n"\
				"'Yeah,' you squeak out. 'I don't really know how I got here, but I'm glad that I had fun...', silence follows.")
			choices = ["'So.... Where am I?'", "'Who are you, by the way?'", "Say nothing"]
			choice = list_choices(choices)
				if choice == 1
					@@t.type("'You're in a bedroom of \"The Balderdash Hotel\", as the locals call it.\n"\
						"It's only the best place you can be, is what!\n"\
						"Here, let me take you to Sylvia, you'll like her a lot!")
					return 'whorehouse(drunk-enter)'
				elsif choice == 2
					@@t.type("'My name is Cassandra! You can call me Cassy, though! I'm one of the originals here\n"\
						"at the Balderdash! You look all dressed up and everything, here let me take you down to Sylvia, you'll like her a lot")
					return 'whorehouse(drunk-enter)'
				else
					@@t.type("'Umm, you don't look too good. Let me take you down to Sylvia'")
					return 'whorehouse(drunk-enter)'
				end
		else
			@@t.type("You went here knowingly!!! You have a great night with Cassandra. She knows her skill well. Almost too well\n"\
				"How are houses like this legal, anyway? You don't know. After the nice night, you head back through the lobby and take yoursef\n"\
				"outside, for the fresh air.")
		end
	end
end

class DarkAlley < Scene
	def enter()
	end
end

class Outside < Scene
	@@responses = ["You really wanna go to that damn cave...", "There's almost nothing that can stop you from going to that cave now",
		"You really wish you had the guts to not go to that cave, but there's just something about it that you want to experience"]

	def initialize(inn = false, whorehouse = false, darkalley = false)
		@inn = inn
		@whorehouse = whorehouse
		@darkalley = darkalley
	end

	def enter()
		if @inn
			@@t.type("As you walk from the inn, you near what looks like a village post board")
		elsif @whorehouse
			@@t.type("As you walk from the whorehouse, you near what looks like a village post board")
		elsif @darkalley
			@@t.type("As you walk away from that darkened alley in to the light, you eventually near what looks like a village post board")
		end

		@@t.type("On it are a variety of different maps, activities, fun-facts, and general conversation items\n"\
			"It draws your eye in, though, and by looking at it, you see that someone posted the directions of Harrow's cave on a sticky note\n"\
			"On the note is what looks to be a very bad drawing of a horned creature, you can't really tell what it is, but obviously\n"\
			"a kid made it... Or maybe someone drunk\n"\
			"You get a realy bad feeling, though... one that you can't resist. You begin to feel anxious to get to the cave, and terrified\n"\
			"\tof what you may find.\n"\
			"You can't explain anything you're feeling to yourself right now, you have never thought that you could feel terrified of a place\n"\
			"\tyou really want to visit, but here you are feeling exactly that. In your mind, you only have two options. Go to the cave right now\n"\
			"and see what all the fuss is about, or wait here and keep on thinking about that cave...\n\n"\
			"What do you do??")
				
		print("> ")
		choice = $stdin.gets.chomp
		while not choice.include?('go')
			puts @@responses[rand(0..3)]
		end
		
		return "road-to-cave(basic)"

	end
end

#--------------------------------Cave Scenes---------------------------------------#
class CaveMouth < Scene
	def enter()
	end
end

class Barracks1 < Scene
	# => Hallway2 leads to this scene. If the character goes back through the hallway without finding the key,
	# 		they will have to make another dash through the hallway, requiring a roll, and possible death.
	def enter()
	end
end

class Barracks2 < Scene
	def enter()
	end
end

class Hallway1 < Scene
	def enter()
	end
end

class Hallway2 < Scene
	def enter()
	end
end

class Hallway3 < Scene
	def enter()
	end
end

class Hallway4 < Scene
	def enter()
	end
end

class Hallway5 < Scene
	def enter()
	end
end

class Hallway6 < Scene
	def enter()
	end
end

class Antechamber < Scene
	def enter()
	end
end

class Kitchen < Scene
	def enter()
	end
end

class DiningRoom < Scene
	def enter()
	end
end

class ServantsDiningRoom < Scene
	def enter()
	end
end

class ServantsQuarters < Scene
	def enter()
	end
end

class EntertainmentRoom < Scene
	def enter()
	end
end

class PleasureRoom < Scene
	def enter()
	end
end

class MasterBedroom < Scene
	def enter()
	end
end

class Bathroom < Scene
	def enter()
	end
end

class SpiralStaircase < Scene
	def enter()
	end
end

class Finished < Scene
	def enter()
	end
end

