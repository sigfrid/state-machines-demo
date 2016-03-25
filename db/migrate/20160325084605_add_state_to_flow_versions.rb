class AddStateToFlowVersions < ActiveRecord::Migration[5.0]
  def change
    add_column :flow_versions, :state, :text
  end
end
