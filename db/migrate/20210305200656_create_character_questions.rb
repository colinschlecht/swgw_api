class CreateCharacterQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :character_questions do |t|
      t.references :character, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
