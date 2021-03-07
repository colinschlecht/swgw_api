class QuestionsSerializer < ActiveModel::Serializer
  attributes :id, :question, :attribute_desc
  has_many :character_questions
  has_many :characters, through: :character_questions

end
