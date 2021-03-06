class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :bio
      t.string :image
      t.string :gender
      t.string :skin_tone
      t.integer :height
      t.string :eye_color
      t.string :hair_color
      t.integer :mass
      t.references :homeworld, null: false, foreign_key: true
      t.references :species, null: false, foreign_key: true
      t.string :birth_year

      t.timestamps
    end
  end
end
