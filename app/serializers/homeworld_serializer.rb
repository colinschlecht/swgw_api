class HomeworldSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :Characters
end
