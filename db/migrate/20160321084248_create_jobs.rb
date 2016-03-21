class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.references :user, foreign_key: true
      t.references :role, foreign_key: true
      t.integer :size

      t.timestamps :created_at
    end
  end
end
