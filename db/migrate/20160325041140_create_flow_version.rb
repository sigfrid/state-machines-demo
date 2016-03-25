class CreateFlowVersion < ActiveRecord::Migration[5.0]
  def change
    create_table :flow_versions do |t|
      t.string :originator_id
      t.string :name
      t.string :color
      t.integer :size

      t.datetime :created_at
    end
  end
end
