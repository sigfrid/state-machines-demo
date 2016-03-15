class AddFlowToEvents < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :flow
    add_foreign_key :events, :flows
  end
end
