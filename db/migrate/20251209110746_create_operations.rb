class CreateOperations < ActiveRecord::Migration[7.1]
  def change
    create_table :operations do |t|
      t.date :date
      t.string :body_part
      t.string :type
      t.string :organization_name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
