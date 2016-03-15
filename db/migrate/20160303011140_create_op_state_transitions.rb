class CreateOpStateTransitions < ActiveRecord::Migration[5.0]
  def change
    create_table :op_state_transitions do |t|
      t.references :op, foreign_key: true
      t.string :namespace
      t.string :event
      t.string :from
      t.string :to
      t.timestamp :created_at
    end
  end
end
