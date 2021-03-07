class AddAnswerToCharacterQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :character_questions, :answer, :string
  end
end
