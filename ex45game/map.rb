#THis file keeps the map object

#Somewhere within Map, I need to put a text.split(/[()]/), which uses a regex, to pass the parameter into the scene. This sounds difficult but I bet it will be pretty easy once I get the game fleshed out.
require "./functions.rb"

class Map
	@@scenes = {
		'dream' => {
			'basic' => Dream.new(),
			'return' => Dream.new(true)
		},
		'inn-bedroom' => {
			'basic'  => InnBedroom.new()
		},
		'inn' => {
			'basic' => Inn.new(),
			'returned' => Inn.new(false, true),
			'kicked-out' => Inn.new(true, false)
		},
		'outside-inn' => {
			'basic' => OutsideInn.new(),
			'returned' => OutsideInn.new(false, true),
			'kicked-out' => OutsideInn.new(true),
		},
		'whorehouse' => {
			'basic' => Whorehouse.new(),
		},
		'whorehouse-room' => {
			'basic' => WhorehouseRoom.new(),
			'drunk-enter' => WhorehouseRoom.new(true)
		},
		'death' => {
			'basic' => Death.new(),
			'inn' => Death.new('inn'),
			'cave_mouth' => Death.new('cave_mouth'),
			'dream_return' => Death.new('dream_return'),
			'barracks_1' => Death.new('barracks_1'),
			'barracks_2' => Death.new('barracks_2'),
			'hallway_1' => Death.new('hallway_1'),
			'hallway_2' => Death.new('hallway_2'),
			'hallway_3' => Death.new('hallway_3'),
			'hallway_4' => Death.new('hallway_4'),
			'hallway_5' => Death.new('hallway_5'),
			'hallway_6' => Death.new('hallway_6'),
			'antechamber' => Death.new('antechamber'),
			'kitchen' => Death.new('kitchen'),
			'dining_room' => Death.new('dining_room'),
			'servants_dining_room' => Death.new('servants_dining_room'),
			'servants_quarters' => Death.new('servants_quarters'),
			'entertainment_room' => Death.new('entertainment_room'),
			'pleasure_room' => Death.new('pleasure_room'),
			'master_bedroom' => Death.new('master_bedroom'),
			'bathroom' => Death.new('bathroom'),
			'spiral_staircase' => Death.new('spiral_staircase')
		},
		'finished' => {
			'basic' => Finished.new()
		},

	}

	def initialize(start_scene)
		@start_scene = start_scene
	end

	def next_scene(scene_name, secondary)
		val = @@scenes[scene_name][secondary]
		return val
	end

	def opening_scene()
		return next_scene(@start_scene, 'basic')
	end
end
