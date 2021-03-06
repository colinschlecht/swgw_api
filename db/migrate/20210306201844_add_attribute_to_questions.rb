class AddAttributeToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :attribute, :string
  end
end
