class ChangeCharacterQuestionsAnserType < ActiveRecord::Migration[6.1]
  def change
    change_column :character_questions, :answer, "boolean USING answer::boolean"
  end
end
