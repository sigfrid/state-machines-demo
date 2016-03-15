class CreateCaseStateTransitions < ActiveRecord::Migration[5.0]
  def change
    create_table :case_state_transitions do |t|
      t.references :case, foreign_key: true
      t.string :namespace
      t.string :event
      t.string :from
      t.string :to
      t.string :name
      t.string :color
      t.integer :rank

      t.timestamp :created_at
    end
  end
end
