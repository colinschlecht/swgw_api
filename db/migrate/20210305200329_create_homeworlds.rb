class CreateHomeworlds < ActiveRecord::Migration[6.1]
  def change
    create_table :homeworlds do |t|
      t.string :name

      t.timestamps
    end
  end
end
