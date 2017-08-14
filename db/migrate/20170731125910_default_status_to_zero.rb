class DefaultStatusToZero < ActiveRecord::Migration[5.0]
  def change
    change_column :reloads, :status, :integer, default: 0
    change_column :transactions, :status, :integer, default: 0
  end
end
