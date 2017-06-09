class RemoveAmountFromOperator < ActiveRecord::Migration[5.0]
  def change
    remove_column :operators, :amount
  end
end
