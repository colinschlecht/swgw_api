class CharacterQuestionsSerializer < ActiveModel::Serializer
  attributes :question_id, :character_id, :answer
  belongs_to :question
  belongs_to :character
end
