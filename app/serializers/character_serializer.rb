class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :gender, :skin_tone, :eye_color, :hair_color, :mass, :birth_year, :height
  belongs_to :species 
  belongs_to :homeworld
  has_many :character_questions
  has_many :questions, through: :character_questions
end
