class AddDysphoriaToFeelings < ActiveRecord::Migration[7.1]
  def change
    add_column :feelings, :dysphoria, :text
  end
end
