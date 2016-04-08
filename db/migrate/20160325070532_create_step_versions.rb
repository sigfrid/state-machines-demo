class CreateStepVersions < ActiveRecord::Migration[5.0]
  def change
    create_table :step_versions do |t|
      t.string :step_id
      t.string :name
      t.integer :position

      t.datetime :created_at
    end
  end
end
