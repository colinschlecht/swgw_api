class Character < ApplicationRecord
  belongs_to :homeworld
  belongs_to :species
end
