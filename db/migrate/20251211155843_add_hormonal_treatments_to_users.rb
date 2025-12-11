class AddHormonalTreatmentsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :treatment_androtardyl, :boolean
    add_column :users, :treatment_nebido, :boolean
    add_column :users, :treatment_bicalutamide, :boolean
    add_column :users, :treatment_decapeptyl, :boolean
    add_column :users, :treatment_progesterone, :boolean
    add_column :users, :treatment_estreva, :boolean
    add_column :users, :treatment_oestrodose, :boolean
    add_column :users, :treatment_oesclim, :boolean
    add_column :users, :treatment_dermestril, :boolean
    add_column :users, :treatment_provames, :boolean
    add_column :users, :treatment_estrofem, :boolean
    add_column :users, :treatment_progynova, :boolean
    add_column :users, :treatment_neofollin, :boolean
    add_column :users, :treatment_gynodian, :boolean
  end
end
