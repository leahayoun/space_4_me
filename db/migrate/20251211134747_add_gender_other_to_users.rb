class AddGenderOtherToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :gender_other, :string
  end
end
