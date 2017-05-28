class CreateOperatorPin < ActiveRecord::Migration[5.0]
  def change
    create_table :operator_pins do |t|
      t.string :pins
      t.integer :status
      t.integer :operator_id
    end
  end
end
