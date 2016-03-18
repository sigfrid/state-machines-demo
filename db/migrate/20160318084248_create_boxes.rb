class CreateBoxes < ActiveRecord::Migration[5.0]
  def change
    create_table :boxes do |t|
      t.references :flow_version, foreign_key: true
      t.references :tag_version, foreign_key: true
      t.integer :size

      t.timestamps :created_at
    end
  end
end
