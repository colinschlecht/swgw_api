require 'rest-client'
require 'pry'
require 'json'

# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# # uncomment and call to seed the database if db was reset.
# # NOTE -- localhost url below will need to be activated.
# # JSON folder can be located in public/db.json 
# json-server --watch db.json

# def get_info_from_api

  
#     # characters
    
#     #gets info from api 
#     response_string = RestClient.get('http://localhost:3000/people')
#     characters = JSON.parse(response_string)
    
#     new_characters = characters.map{|c| c["fields"]}

#     db_fill = new_characters.map do |char|
#         Character.create(name: char["name"], 
#             image: char["image"], 
#             gender: char["gender"], 
#             skin_color: char["skin_color"], 
#             height: char["height"], 
#             eye_color: char["eye_color"], 
#             hair_color: char["eye_color"], 
#             mass: char["mass"], 
#             birth_year: char["birth_year"])
#     end

#     characters = Character.all 
#     characters.map do |char|
        
#        Answer.create(answer: "Yes!", question: Question.create(question: "Is this character: #{char["name"]}", character_id: char[:id]))
#        Answer.create(answer: "Yes!", question: Question.create(question: "Is this character likely to identify as a #{char["gender"]}", character_id: char[:id]))
#        Answer.create(answer: "Yes!", question: Question.create(question: "Does this character have a skin tone that is #{char["skin_color"]}", character_id: char[:id]))
#        Answer.create(answer: "Yes!", question: Question.create(question: "Are the character's eyes #{char["eye_color"]}", character_id: char[:id]))
#        Answer.create(answer: "Yes!", question: Question.create(question: "Does this character have a hair color of #{char["eye_color"]}", character_id: char[:id]))
#        Answer.create(answer: "Yes!", question: Question.create(question: "Is this character greater than or equal to a mass of #{char["mass"]}", character_id: char[:id]))
#        Answer.create(answer: "Yes!", question: Question.create(question: "Was this character born greater than or equal to #{char["birth_year"]}", character_id: char[:id]))
#        Answer.create(answer: "Yes!", question: Question.create(question: "Is this character's height in centemeters atleast #{char["height"]}", character_id: char[:id]))
#     end
 

# end
# get_info_from_api