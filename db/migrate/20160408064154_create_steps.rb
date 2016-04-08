class CreateSteps < ActiveRecord::Migration[5.0]
  def change
    create_table :steps do |t|
      t.string :name
      t.integer :position
      t.string :state

      t.timestamps null: false
    end
  end
end
