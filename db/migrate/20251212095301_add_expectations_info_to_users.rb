class AddExpectationsInfoToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :expectations_info, :text
  end
end
