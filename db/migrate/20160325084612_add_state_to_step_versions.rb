class AddStateToStepVersions < ActiveRecord::Migration[5.0]
  def change
    add_column :step_versions, :state, :text
  end
end
