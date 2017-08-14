class AddUserIdToOperatorPins < ActiveRecord::Migration[5.0]
  def change
    add_column :operator_pins, :user_id, :integer
  end
end
