class ChangeBirthYearToBeIntegerInCharacters < ActiveRecord::Migration[6.1]
  def change
    change_column :characters, :birth_year, 'integer USING CAST(birth_year AS integer)'
  end
end
