class AddAmountToOperatorPins < ActiveRecord::Migration[5.0]
  def change
    add_column :operator_pins, :amount, :integer
  end
end
