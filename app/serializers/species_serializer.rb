class SpeciesSerializer < ActiveModel::Serializer
  attributes :name
  has_many :characters
end
