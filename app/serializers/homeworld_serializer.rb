class HomeworldSerializer < ActiveModel::Serializer
  attributes :name
  has_many :Characters
end
