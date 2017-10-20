class RenameColumnIntegerForInternationalTopUp < ActiveRecord::Migration[5.0]
  def change
    rename_column :international_top_ups, :integer, :ref_id
  end
end
