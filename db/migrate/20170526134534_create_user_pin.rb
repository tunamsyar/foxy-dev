class CreateUserPin < ActiveRecord::Migration[5.0]
  def change
    create_table :user_pins do |t|
      t.integer :pin_id
      t.integer :user_id
    end
  end
end
