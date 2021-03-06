class ChangeAttributeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :questions, :attribute, :attribute_desc
  end
end
