#This sets up a method to be able to have text act like it's being written currently!! Should be fun.

class Typewriter

	@@type_hash = {
		'slow' => 0.2,
		'regular' => 0.1,
		'fast' => 0.08
	}


	@@speed = @@type_hash['regular']
	attr_reader :speed

	def type(text)
		split_text = text.split("")
		split_text.each {|letter|
			print letter
			sleep(@@speed)
		}
		puts "\n"
	end

	def change_speed(speed)
		if !@@type_hash.key?(speed)
			print "Wrong key entered. Please only enter 'slow', 'regular', or 'fast'"
		else
			@@speed = @@type_hash[speed]
		end
	end

	def get_speed()
		return @@type_hash.key(@@speed)
	end
end

