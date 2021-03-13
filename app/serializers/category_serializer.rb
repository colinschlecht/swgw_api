class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name, :questions
  has_many :questions
end
