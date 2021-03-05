class CharacterQuestion < ApplicationRecord
  belongs_to :character
  belongs_to :question
end
