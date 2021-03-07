class SpeciesSerializer < ActiveModel::Serializer
  attributes :name
  has_many :Characters
end
