class ChangeTypeColumnInAppointments < ActiveRecord::Migration[7.1]
  def change
   remove_column :appointments, :type, :string
   add_column :appointments, :event_type, :string
  end
end
