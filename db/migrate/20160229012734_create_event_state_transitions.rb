class CreateEventStateTransitions < ActiveRecord::Migration[5.0]
  def change
    create_table :event_state_transitions do |t|
      t.references :event, foreign_key: true
      t.string :namespace
      t.string :event
      t.string :from
      t.string :to
      t.timestamp :created_at
    end
  end
end
