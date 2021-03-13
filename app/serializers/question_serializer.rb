class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :question, :attribute_desc, :category
  belongs_to :category
  has_many :character_questions
  has_many :characters, through: :character_questions

end
