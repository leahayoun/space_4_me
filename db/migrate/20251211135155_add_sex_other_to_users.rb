class AddSexOtherToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :birth_sex_other, :string
  end
end
