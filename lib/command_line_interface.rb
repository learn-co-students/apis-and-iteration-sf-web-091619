def welcome
  puts "Hello!"
end

def get_character_from_user
  puts "Please enter a character name (options below)"
  puts get_all_info["results"].map {|stuff| stuff["name"]}
  user_input = gets.chomp

  if get_all_info["results"].map {|stuff| stuff["name"].downcase}.include?(user_input.downcase)
    user_input.downcase 
  else
    puts "Your input is not valid. Please try again."
    get_character_from_user
  end
end



