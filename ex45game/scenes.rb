class Scene
	def enter()
		puts "This is the base scene class. This should not be showing up at all, so make sure\n"\
		"there is everything that you need within the other classes"
	end
end

class Death < Scene

	#For each area, I want different types of deaths.
	@@death_scene_hash = {
		'cave_mouth' => nil,
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
		'spiral_staircase' => nil
	}

	def initialize(scene_of_death = nil)
		#Input the scene_of_death within each death callout. Or don't.
		@scene_of_death = scene_of_death
	end

	def enter()
		if !@scene_of_death
			puts "Wow.... You died...."
		else
			#Randomize the type of death within the area death scenes!
			puts death_scene_hash[@scene_of_death[rand(0...death_scene_hash[@scene_of_death].length)]]
		end
	end
end


#--------------------------------Village Scenes------------------------------------#
class Inn < Scene
	def enter()
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

