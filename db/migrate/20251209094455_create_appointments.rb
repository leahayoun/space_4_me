class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.string :title
      t.text :content
      t.string :address
      t.date :date
      t.string :type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
