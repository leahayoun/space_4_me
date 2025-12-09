class ChangeTypeColumnInOperations < ActiveRecord::Migration[7.1]
  def change
    remove_column :operations, :type, :string
    add_column :operations, :operation_type, :string
  end
end
