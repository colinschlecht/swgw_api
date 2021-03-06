class Question < ApplicationRecord
  belongs_to :category
  has_many :characters, through: :character_questions
end
