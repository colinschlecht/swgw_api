class HomeworldSerializer < ActiveModel::Serializer
  attributes :name
  has_many :characters
end
