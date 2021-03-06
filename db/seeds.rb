require 'rest-client'
require 'pry'
require 'json'

#To seed the database, ucomment each method and method call. NOTE -- localhost url below will need to be activated.
# Each JSON file can be located in public folder. In the terminal, run: json-server --watch db.json
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#Be sure to seed home_world and species before characters.


def seed_questions
    
end

def seed_categories
    Category.create(name: "Name")
    Category.create(name: "Gender")
    Category.create(name: "Skin tone")
    Category.create(name: "Height")
    Category.create(name: "Eye color")
    Category.create(name: "Hair color")
    Category.create(name: "Mass")
    Category.create(name: "Home world")
    Category.create(name: "Species")
    Category.create(name: "Birth year")
end


def seed_home_world
    response_string = RestClient.get('http://localhost:3000/planets')
    home_worlds_parsed = JSON.parse(response_string)
    new_home_worlds = home_worlds_parsed.map{|c| c["fields"]}
    db_fill_planets = new_home_worlds.map do |planet|
        Homeworld.create(name: planet["name"])
    end
end


def seed_species
    response_string = RestClient.get('http://localhost:3000/species')
    species_parsed = JSON.parse(response_string)
    new_species = species_parsed.map{|c| c["fields"]}
    db_fill_species = new_species.map do |spec|
        Species.create(name: spec["name"])
    end
end


    
def seed_characters
    response_string = RestClient.get('http://localhost:3000/people')
    characters_parsed = JSON.parse(response_string)
    new_characters = characters.map{|c| c["fields"]}
    db_fill_characters = new_characters.map do |char|
        Character.create(name: char["name"], 
            image: char["image"], 
            gender: char["gender"], 
            skin_tone: char["skin_tone"], 
            height: char["height"].to_i, 
            eye_color: char["eye_color"], 
            hair_color: char["hair_color"], 
            mass: char["mass"].to_i,
            homeworld_id: char["homeworld_id"],
            species_id: char["species_id"],
            birth_year: char["birth_year"].to_i)
    end
end

seed_categories
# seed_home_world
# seed_species

# seed_characters


 
