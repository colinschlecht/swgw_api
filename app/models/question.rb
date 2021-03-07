class Question < ApplicationRecord
  belongs_to :category
  has_many :character_questions
  has_many :characters, through: :character_questions
end
