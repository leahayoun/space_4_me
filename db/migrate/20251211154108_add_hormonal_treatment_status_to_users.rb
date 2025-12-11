class AddHormonalTreatmentStatusToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :hormonal_treatment_status, :string
  end
end
