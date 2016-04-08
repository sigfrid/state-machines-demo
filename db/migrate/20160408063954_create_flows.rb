class CreateFlows < ActiveRecord::Migration[5.0]
  def change
    create_table :flows do |t|
      t.string :name
      t.string :color
      t.integer :size
      t.string :state

      t.timestamps null: false
    end
  end
end
