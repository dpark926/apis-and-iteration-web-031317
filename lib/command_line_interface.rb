require 'rest-client'
require 'json'
require 'pry'


def welcome
	puts "Star Wars API welcome to, Youngling."
  # puts out a welcome message here!
end

def get_character_from_user
  puts "Please enter a character:"
  user_input = gets.chomp.downcase

  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  array = []

  character_hash["results"].each do |character_array|
    array << character_array["name"].downcase
  end

  if array.include?(user_input) == false
  	get_character_from_user
  else
  	return user_input
  end
 
  # use gets to capture the user's input. This method should return that input, downcased.
end

