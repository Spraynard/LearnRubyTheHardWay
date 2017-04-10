require "./functions.rb"
# => I want to 'type' everything out!
require "./typewriter.rb"

class Scene
	#I want to set a new typewriter instance for each scene
	@@t = Typewriter.new('very_fast')

	def enter()
		puts "This is the base scene class. This should not be showing up at all, so make sure\n"\
		"tat the cave mouth is everything that you need within the other classes"
	end
end

class Death < Scene

	#For each area, I want different types of deaths.
	@@death_scene_hash = {
		'cave_mouth' => ["You really shouldn't have died at the cave mouth...",
						"How the hell did you even die at the cave mouth?"],
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
			@@t.type("Wow.... You died....")
		else
			#Randomize the type of death within the area death scenes!
			@@t.type(@@death_scene_hash[@scene_of_death][rand(0...@@death_scene_hash[@scene_of_death].length)])
		end
	end
end


#--------------------------------Village Scenes------------------------------------#
class Dream < Scene
	def enter()
		@@t.type("\tYour eyes open, but you can't see anything; nothing but pitch blackness surrounds you wherever you look.\n"\
				"Fear starts to grow inside your stomach. You can hear something, it sounds like the\n"\
				"whistle of wind going very fast, but you get a feeling of complete and utter stillness around you.\n"\
				"Quickly, you reach for your pocket and pull out your bronzed lighter, flick it open, and light it up.\n"\
				"For a second there you thought you might have been blind, but the steady flame comforts your mind.\n"\
				"You reach down to the ground to brace yourself, and as you stand up, you suddenly feel\nthat you were sitting in at least a foot deep of water\n"\
				"How didn't you notice it before?")
		@@t.change_speed('slow')
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
				"but you don't care. you resign yourself completely. Absolute pain comes suddenly, and fiercely.")
		sleep(5)
	end
end

class Inn < Scene
	def enter()
		@@t.type("Hello!!!")
	end
end

class InnBedroom < Inn
	def enter()
		@@t.type("You wake up in an unfamiliar room.")
	end
end

class Whorehouse < Scene
	def enter()
	end
end

class DarkAlley < Scene
	def enter()
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

