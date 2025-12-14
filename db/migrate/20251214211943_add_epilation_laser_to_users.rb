class AddEpilationLaserToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :epilation_laser, :boolean
  end
end
