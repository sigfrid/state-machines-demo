class CreateBoxes < ActiveRecord::Migration[5.0]
  def change
    create_table :boxes do |t|
      t.references :flow_version, foreign_key: true
      t.references :step_version, foreign_key: true
      t.string :activity

      t.datetime :created_at
    end
    add_index :boxes, [:flow_version_id, :step_version_id]
  end
end
