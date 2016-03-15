class CreateOps < ActiveRecord::Migration[5.0]
  def change
    create_table :ops do |t|
      t.string :name
      t.string :state

      t.timestamps
    end
  end
end
