class Character < ApplicationRecord
  belongs_to :homeworld
  belongs_to :species
  has_many :questions, through: :character_questions 
end
