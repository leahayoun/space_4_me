class AddOperationStatusToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :operation_status, :string
  end
end
