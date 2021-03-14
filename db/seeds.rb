require 'rest-client'
require 'pry'
require 'json'

#To seed the database, ucomment each method and method call. NOTE -- localhost url below will need to be activated.
# Each JSON file can be located in public folder. In the terminal, run: json-server --watch db.json
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#Be sure to seed home_world and species before characters.




def seed_character_questions

    Question.all.each do |q|   
        Character.all.each do |c|
        cq = CharacterQuestion.new
        cq.character_id = c.id
        cq.question_id = q.id
        case q.category_id
        when 1
            cq.answer = c.name == q.attribute_desc
        when 2
            cq.answer = c.gender == q.attribute_desc 
        when 3
            cq.answer = c.skin_tone == q.attribute_desc  
        when 4
            if q.attribute_desc != 0
                case q.attribute_desc
                when 100
                    cq.answer = c.height <= q.attribute_desc
                when 200
                    cq.answer = c.height >= q.attribute_desc
                end
            else
                cq.answer = c.height == q.attribute_desc
            end
        when 5
            cq.answer = c.eye_color == q.attribute_desc    
        when 6
            cq.answer = c.hair_color == q.attribute_desc
        when 7
            if q.attribute_desc != 0
                case q.attribute_desc
                when 50
                    cq.answer = c.mass <= q.attribute_desc
                when 75
                    cq.answer = c.mass >= q.attribute_desc
                end
            else
                cq.answer = c.mass == q.attribute_desc
            end
        when 8
            cq.answer = c.homeworld == q.attribute_desc
        when 9
            cq.answer = c.species == q.attribute_desc
        when 10
            if q.attribute_desc != 0
                case q.attribute_desc
                when 100
                    cq.answer = c.birth_year <= q.attribute_desc
                when 50
                    cq.answer = c.birth_year <= q.attribute_desc
                end
            else
                cq.answer = c.birth_year == q.attribute_desc
            end            
        else
            puts "update seeds to continue"
        end 
        cq.save
        end
    end



end



def seed_questions
    
    
    names = ["C-3PO", "Darth Vader", "Leia Organa", "Owen Lars", "Beru Whitesun lars", "Biggs Darklighter", "Obi-Wan Kenobi", "Anakin Skywalker", "Wilhuff Tarkin", "Chewbacca", "Han Solo", "Greedo", "Jabba Desilijic Tiure", "Wedge Antilles", "Jek Tono Porkins", "Yoda", "Palpatine", "Boba Fett", "Bossk", "Lando Calrissian", "Lobot", "Ackbar", "Arvel Crynyd", "Wicket Systri Warrick", "Nien Nunb", "Qui-Gon Jinn", "Nute Gunray", "Padmé Amidala", "Jar Jar Binks", "Roos Tarpals", "Rugor Nass", "Ric Olié", "Watto", "Sebulba", "Quarsh Panaka", "Shmi Skywalker", "Darth Maul", "Bib Fortuna", "Ayla Secura", "Dud Bolt", "Gasgano", "Ben Quadinaros", "Mace Windu", "Ki-Adi-Mundi", "Eeth Koth", "Adi Gallia", "Saesee Tiin", "Mon Mothma", "Luke Skywalker", "Finis Valorum", "Yarael Poof", "Plo Koon", "Mas Amedda", "Gregar Typho", "Cordé", "Cliegg Lars", "Poggle the Lesser", "Luminara Unduli", "Barriss Offee", "Dormé", "Dooku", "Bail Prestor Organa", "Jango Fett", "Zam Wesell", "Dexter Jettster", "Lama Su", "Taun We", "Jocasta Nu", "San Hill", "Shaak Ti", "Tarfful", "Raymus Antilles", "Sly Moore", "Tion Medon", "Grievous", "R4-P17", "Wat Tambor", "Ratts Tyerel", "R5-D4", "R2-D2", "IG-88"]
    genders = ["non-binary", "male", "female"]
    skin_tone = ["gold", "pale-white", "fair", "brown-ish", "green-ish", "tan", "dark", "grey-ish", "orange-ish", "red-ish", "blue", "yellow-ish"] 
    eye_colors = ["yellow",  "brown",  "blue", "black", "orange", "hazel",  "red", "pink", "gold", "white",  "green",  "unknown"] 
    hair_colors = [ "none", "brown", "black", "white",  "grey", "blond"]
    home_worlds = ["Tatooine", "Alderaan", "Stewjon", "Eriadu", "Kashyyyk", "Corellia", "Rodia", "Nal Hutta", "Bestine IV", "unknown", "Naboo", "Kamino", "Trandosha", "Socorro", "Bespin", "Mon Cala", "Endor", "Sullust", "Cato Neimoidia", "Toydaria", "Malastare", "Dathomir", "Ryloth", "Vulpter", "Troiken", "Tund", "Haruun Kal", "Cerea", "Iridonia", "Coruscant", "Iktotch", "Chandrila", "Quermia", "Dorin", "Champala", "Geonosis", "Mirial", "Serenno", "Concord Dawn", "Zolan", "Ojom", "Muunilinst", "Shili", "Umbara", "Utapau", "Kalee", "Skako", "Aleen Minor"] 
    species = ["Droid", "Human", "Wookie", "Rodian", "Iktotchi", "Geonosian", "Mon Calamari", "Trandoshan", "Ewok", "Sullustan", "Neimodian", "Gungan", "Toydarian", "Dug", "Zabrak", "Twi'lek", "Vulptereen", "Xexto", "Cerean", "Tholothian", "Quermian", "Kel Dor", "Chagrian", "Mirialan", "Clawdite", "Besalisk", "Muun", "Togruta", "umbaran", "Pau'an", "Kaleesh", "Skakoan", "Aleena"]
    mass = [75, 136, 49, 120, 84, 77, 0, 112, 80, 74, 1, 110, 17, 78, 113, 79, 83, 20, 68, 89, 90, 45, 66, 82, 40, 55, 65, 50, 85, 56, 102, 88, 57, 48, 159, 15, 32, 140] 
    ages = [30, 41, 19, 52, 47, 24, 57, 64, 200, 29, 44, 600, 21, 0, 896, 82, 31, 53, 37, 8, 92, 46, 62, 72, 54, 48, 91, 385, 58, 40, 102, 67, 66, 33, 15]  
    heights = [167, 202, 150, 178, 165, 183, 182, 188, 180, 228, 173, 175, 170, 66, 190, 177, 0, 88, 160, 193, 191, 185, 196, 224, 206, 137, 112, 163, 94, 122, 198, 171, 184, 172, 264, 157, 166, 168, 229, 213, 234, 216, 96, 79, 97, 200] 



    names.each do |name|
        Question.create(question: "Is this mystery character #{name}?", category_id: 1, attribute_desc: name)
    end
    genders.each do |gender|
        Question.create(question: "Is this mystery character likely to identify as #{gender}?", category_id:2, attribute_desc: gender)
    end
    skin_tone.each do |tone|
        Question.create(question: "Does this character have an exterior color (excluding armor) or skin-tone that is #{tone}?", category_id: 3, attribute_desc: tone)
    end
    eye_colors.each do |color|
        if color == "unknown"
            Question.create(question: "Does this character have a known eye color?", category_id: 5, attribute_desc: color)
        else 
            Question.create(question: "Does this character have #{color} eyes?", category_id: 5, attribute_desc: color)
        end
    end
    hair_colors.each do |color|
        if color == "none"
            Question.create(question: "Does this character have hair?", category_id: 6, attribute_desc: color)
        else
            Question.create(question: "Does this character have #{color} hair?", category_id: 6, attribute_desc: color)
        end
    end
    home_worlds.each do |world|
        if world == "unknown"
            Question.create(question: "Does this character have a known home world?", category_id: 8, attribute_desc: world)
        else
            Question.create(question: "Is this character's homeworld #{world}", category_id: 8, attribute_desc: world)
        end
    end
    species.each do |spec|
        if spec == "unknown"
            Question.create(question: "Does this character have a known species?", category_id: 9, attribute_desc: spec)
        else
            Question.create(question: "Is this character a #{spec}?", category_id: 9, attribute_desc: spec)
        end
    end

        Question.create(question: "Does this character have a known Mass?", category_id: 7, attribute_desc: 0)
        Question.create(question: "Does this character have a mass below 50?", category_id: 7, attribute_desc: 50)
        Question.create(question: "does this character have a mass above 75?", category_id: 7, attribute_desc: 75)

        Question.create(question: "Does this character have a known birth year?", category_id: 10, attribute_desc: 0)
        Question.create(question: "Was this character born within 50 years of the Battle of Yavin? (BBY)", category_id: 10, attribute_desc: 50)
        Question.create(question: "Was this character born within 100 years of the Battle of Yavin? (BBY)", category_id: 10, attribute_desc: 100)
    
        Question.create(question: "Does this character have known height?", category_id: 4, attribute_desc: 0)
        Question.create(question: "Is this character under 100cm?", category_id: 4, attribute_desc: 100)
        Question.create(question: "Is this character over 200 cm?", category_id: 4, attribute_desc: 200)
    
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
    response_string  = File.read('./public/people.json')
    # response_string = RestClient.get('http://localhost:3000/characters')
    characters_parsed = JSON.parse(response_string)
    db_fill_characters = characters_parsed["characters"].map do |char|
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
seed_characters
#  seed_questions
# seed_character_questions
