class AddDump < ActiveRecord::Migration[5.0]
  def change
    add_column :case_state_transitions, :dump, :text
    remove_column :case_state_transitions, :name
    remove_column :case_state_transitions, :color
    remove_column :case_state_transitions, :rank    
  end
end
