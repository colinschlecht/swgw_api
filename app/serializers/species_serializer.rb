class SpeciesSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :Characters
end
