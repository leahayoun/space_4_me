class CreateUserSymptoms < ActiveRecord::Migration[7.1]
  def change
    create_table :user_symptoms do |t|
      t.references :symptom, null: false, foreign_key: true
      t.references :feeling, null: false, foreign_key: true

      t.timestamps
    end
  end
end
