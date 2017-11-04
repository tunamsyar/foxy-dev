class AddCreatedAtToPins < ActiveRecord::Migration[5.0]
  def change
    add_column :operator_pins, :created_at, :datetime
    add_column :operator_pins, :updated_at, :datetime
  end
end
