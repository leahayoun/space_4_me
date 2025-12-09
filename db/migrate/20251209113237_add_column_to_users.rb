class AddColumnToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :birth_sex, :string
    add_column :users, :gender, :string
    add_column :users, :date_of_birth, :date
  end
end

