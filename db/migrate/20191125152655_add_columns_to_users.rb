class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :primary_number, :string
    add_column :secondary_number, :string
    add_column :primary_first_name, :string
    add_column :primary_last_name, :string
    add_column :secondary_first_name, :string
    add_column :secondary_last_name, :string
  end
end
