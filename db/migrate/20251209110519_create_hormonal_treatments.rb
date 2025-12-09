class CreateHormonalTreatments < ActiveRecord::Migration[7.1]
  def change
    create_table :hormonal_treatments do |t|
      t.integer :dosage
      t.string :product_name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
