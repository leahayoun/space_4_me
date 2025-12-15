class AddSportToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :sport, :boolean
  end
end
