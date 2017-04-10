# Code for the rooms
def cave_mouth
	puts """
It's late evening of.. Monday? Tuesday? You don't know. The only thought in your mind you've had 
today is how long you've traveled to get here. Has it really been a month since you've set
out on this journey?
\nYou think so.\n
"""
	sleep(1)
	puts """
Suddenly, you see a rock formation above the horizon. Your heart races as you know it must be
Harrow's Cave.
"""
	sleep(1)
	puts """
You race towards the cave entrance. It seems that every fiber of your being is drawing you towards it.
Minutes of racing brings you to the entrance. A post in front of the entrance says \"Harrow's Cave\",
and you know you've made it. You want to enter the cave. What do you do?
"""
	while true
		enter = user_input
		if enter.include?("enter")
			hallway_1
			break
		else
			puts "You don't want to do that. You really wanna ENTER that there cave! What do you do?"
		end
	end
end

def barracks_1
	puts "You enter Barracks #1"
end

def barracks_2
	puts "You enter Barracks #2"
end

def barracks_3
	puts "You enter Barracks #3"
end

def barracks_4
	button = false

	puts """
You dive as the walls close in behind you, rattling the whole room in the process.
Dust from the ceiling falls on your head. \"Well, that was probably the most dangerous thing I've done
in my whole life!\" you think, as you stand up and brush yourself off.
"""

	puts "You look around."
	puts "You see multiple bunkbeds with chests in front of them 'This is a barracks', you think to yourself"
	puts "What kind of trouble have you gotten yourself into?"
	puts "You don't see anything around, but you could always look, or go back..."
	puts "1. Look Around"
	puts "2. Go Back"

	choice = user_input
	if choice == "1" || choice == "1." || choice.include?("look")
		puts """
As you look around the barracks, you actually become really glad you did. There must have been some
really important soldiers in here, cuz you're able to pick  up some nice litle trinkets, and even a sword!
"""
		puts "When you reach the end of your search, you come to marvel at a really big, red button!"
		puts "There used to be writing on it, but now you can't tell what it says, it's been pressed too many times"
		puts "What do you do with the button?"

		ch

end

def antechamber
	puts "You enter the Antechamber"
end

def spiral_staircase
	puts "You go down the spiral staircase"
end

def dining_chamber
	puts "You enter the dining chamber"
end

def servants_dining_room
	puts "You enter the servants dining chamber"
end

def servants_quarters
	puts "You enter the servants quarters"
end

def kitchen
	puts "You enter the kitchen"
end

def entertainment_room
	puts "You enter the entertainment room"
end

def master_bedroom
	puts "You enter the master bedroom"
end

def bathroom
	puts "You enter the bathroom"
end

def pleasure_room
	puts "You enter the pleasure room"
end


# Code for secrets
def secret_1
	puts "This is secret #1"
end

def secret_2
	puts "This is secret #2"
end

def secret_3
	puts "This is secret #3"
end

def secret_4
	puts "This is secret #4"
end

# Code for all the hallways
def hallway_1(re_enter = false)
	if re_enter
		puts """
You enter back into the hallway. The huge structure is still as magical
as before.
"""
	else
		puts """
You enter into an absolutely huge hallway, probably bigger than any hallway you've ever seen.
Massive. Humongous. But what's really weird about this hallway, is that you also notice there are
only five exits you can see in front of you. A hallway this big should have hundreds of rooms off of it,
you feel.
	"""
		puts "There are rooms to your right, left, far-left, far-right, and in front of you"
		puts "WHere do you want to go?"
		puts "\t1. Right"
		puts "\t2. Left"
		puts "\t3. Far-Right"
		puts "\t4. Far-Left"
		puts "\t5. Forward"
		choice = user_input
		if choice == "1" || choice == "right"
			hallway_5
			# barracks_4
		elsif choice == "2" || choice == "left"
			barracks_3
		elsif choice == "3" || choice == "far-right" || choice == "far right"
			barracks_2
		elsif choice == "4" || choice == "far-left" || choice == "far left"
			barracks_1
		elsif choice == "5" || choice == "forward"
			antechamber
		else
			puts "Learn how to enter a room, lol..."
			hallway_1
		end
	end
end

def hallway_2
	#Leads into entertainment room
	puts "Hallway 2"
end

def hallway_3
	#Leads into dining chamber
	puts "Hallway 3"
end

def hallway_4
	#Leads into kitchen
	puts "Hallway 4"
end

def hallway_5(button = false,back = false)
	#Leads into barracks_4
	puts "Hallway 5"
	puts """
The hallway you enter is dark... You try and look down it, but there's just complete blackness ahead.
Luckily you are a smart individual, and you packed a long lasting torch. You also packed a heavy duty
lighter, so you make sure to light that shit up!
"""
	puts "It's a long walk down the hallway"
	sleep(5)
	puts "It seems like you've been walking for miles!!!! It wont stop.... Do you want to turn around?"
	puts "1. Yes"
	puts "2. No"
	choice = user_input
	if choice == "1" || choice == "1." || choice == "yes"
		hallway_1
	else
		puts "While walking, you hear a dull click that resonates throughout your whole body"
		puts "You shudder in shock as you notice the walls are closing in ahead of you."
		puts "RUN!!!!"
		chance = roll_a_die
		if chance <= 2 && !button
			lose("You couldn't make it. Sorry")
		end
		if back
			hallway_1
		else
			barracks_4
	end
end

def hallway_6
	#Leads into barracks_3
	puts "Hallway 6"
end

def hallway_7
	#Leads into barracks_2
	puts "Hallway 7"
end

def hallway_8
	#Leads into barracks_1
	puts "Hallway 8"
end

def hallway_9
	puts "Hallway 9"
end

#Game functions
def user_input
	print "> "
	response = $stdin.gets.chomp.downcase
	return response
end

def roll_a_die
	roll = 1 + rand(20)
	puts "You roll a 20 sided die! Your roll is #{roll}"
	return roll
end

def lose(lose_text)
	if lose_text == ""
		puts "You lost, try again..."
	else
		puts lose_text
	end
	exit(0)

end

def start
	puts """
You swear that you should have gotten to Harrow's Cave much ealier.
The sign you saw on the outgoing road of the last town you visited read \n\"Harrow's Cave:\n
You're almost there!!!\"\n but you're pretty positive you shoulda been there by now!
There's no chance you could have made a wrong turn or anything...
"""
	puts "Do you: "
	puts "\t1. Travel on and try to find the cave you worked so long to get to."
	puts "\t2. Turn around, fed up with every little problem that has come your way since you started the journey."
	response = user_input
	if response == "1" || response == "1."
		puts "You travel on..."
		sleep(2)
		puts "\nAnd On..."
		sleep(2)
		cave_mouth
	else
		text = """
\"It's not worth it\", you say in your head. You just can't take the challenge.... 
Who knows what you missed back there. 
You live your life as fruitfully as before, 
but on your deathbed, you express regretfor never going into Harrow's Cave
"""
		lose(text)
	end
end

# start
# hallway_5

