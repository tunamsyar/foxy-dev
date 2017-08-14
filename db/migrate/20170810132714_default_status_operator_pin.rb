class DefaultStatusOperatorPin < ActiveRecord::Migration[5.0]
  def change
    change_column :operator_pins, :status, :integer, default: 0
  end
end
