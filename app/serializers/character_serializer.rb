class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :image,
  belongs_to :species 
  belongs_to :homeworld
end
