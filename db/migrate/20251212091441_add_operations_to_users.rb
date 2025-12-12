class AddOperationsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :operation_torsoplastie, :boolean
    add_column :users, :operation_phalloplastie, :boolean
    add_column :users, :operation_metaiodoplastie, :boolean
    add_column :users, :operation_hysterectomie, :boolean
    add_column :users, :exercices_voix_m, :boolean
    add_column :users, :operation_bodybuilding_followup, :boolean
    add_column :users, :operation_fronto_orbital_contouring, :boolean
    add_column :users, :operation_rhinoplastie, :boolean
    add_column :users, :operation_genioplastie, :boolean
    add_column :users, :operation_tracheal_shave, :boolean
    add_column :users, :operation_glottoplastie, :boolean
    add_column :users, :operation_vaginoplastie, :boolean
    add_column :users, :operation_labiaplastie, :boolean
    add_column :users, :operation_orchiectomie, :boolean
    add_column :users, :operation_liposculpture_feminisante, :boolean
    add_column :users, :operation_bbl, :boolean
    add_column :users, :exercices_voix_f, :boolean
    add_column :users, :operation_epilation_laser, :boolean
  end
end
