class CreateCases < ActiveRecord::Migration[5.0]
  def change
    create_table :cases do |t|
      t.string :state
      t.string :name
      t.string :color
      t.integer :rank

      t.timestamps
    end
  end
end
