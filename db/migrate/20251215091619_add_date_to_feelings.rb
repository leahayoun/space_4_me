class AddDateToFeelings < ActiveRecord::Migration[7.1]
  def change
    add_column :feelings, :date, :date
  end
end
