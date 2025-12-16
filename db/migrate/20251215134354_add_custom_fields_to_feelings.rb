class AddCustomFieldsToFeelings < ActiveRecord::Migration[7.1]
  def change
    add_column :feelings, :custom_mood, :string
    add_column :feelings, :custom_symptom, :string
  end
end
