#This file keeps the Harrow's Cave game 
#In order to work with the scene_map, need to use text.split(/[()]/).
# => This will be included in a function, which is in the functions.rb file.
require './functions.rb'

class Engine
	def initialize(scene_map, tester = false)
		@scene_map = scene_map
		@tester = tester
	end

	def play()
		if @tester == true
			puts "Where would you like to start? (input in 'room-name(param)' format!"
			choice = user_input_for_tests
			scene, param = scene_splitter(choice)
			current = @scene_map.next_scene(scene, param)
		else
			current = @scene_map.opening_scene()
			last = @scene_map.next_scene('finished', 'basic')
		end

		while current != last
			next_scene_name = current.enter()
			scene_params = scene_splitter(next_scene_name)
			current = @scene_map.next_scene(scene_params[0], scene_params[1])
		end
		current.enter()
	end
end

