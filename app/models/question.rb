class Question < ApplicationRecord
  belongs_to :category
  has_many :characters, through: :character_questions

  def self.all 
    @@all = Character.all
  end
end
