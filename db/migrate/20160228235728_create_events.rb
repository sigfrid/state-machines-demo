class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :description
      t.string :state

      t.timestamps
    end
  end
end
