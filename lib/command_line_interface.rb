def welcome
  # puts out a welcome message here!
end
 
def get_character_from_user
  print "Please enter a character name: "
  gets.chomp.downcase
  # use gets to capture the user's input. This method should return that input, downcased.
end
