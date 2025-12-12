class AddHowFoundToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :how_found, :text
  end
end
