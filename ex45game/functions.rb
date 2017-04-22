def roll_die
	roll = 1 + rand(0...20)
	puts "\nYou roll a 20 Sided Die, and the roll you got was #{roll}\n"
	return roll
end

def list_choices(list_of_choices)
	counter = 1
	puts "\n"
	for c in list_of_choices
		puts counter.to_s + ". " + c
		counter += 1
	end
	choice = user_input
	while choice > counter - 1
		puts "That is not one of the choices, please enter an actual choice"
		choice = user_input
	end
	return choice
end

def user_input
	puts "\nWhat is your choice?"
	print "> "
	choice = $stdin.gets.chomp
	while choice.to_i == 0
		puts "That's not a number, you dingus. Try again."
		print "> "
		choice = $stdin.gets.chomp
	end
	return choice.to_i
end

def user_input_for_tests
	print "> "
	choice = $stdin.gets.chomp
	return choice
end

def scene_splitter(scene_name)
	scene, param = scene_name.split(/[()]/)
	return [scene, param]
end





