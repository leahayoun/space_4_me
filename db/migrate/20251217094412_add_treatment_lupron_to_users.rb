class AddTreatmentLupronToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :treatment_lupron, :boolean
  end
end
