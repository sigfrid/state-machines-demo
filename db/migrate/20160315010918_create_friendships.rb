class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships do |t|
      t.references :case_state_transition, foreign_key: true
      t.references :op_state_transition, foreign_key: true
      t.string :temperature

      t.timestamps :created_at
    end
  end
end
