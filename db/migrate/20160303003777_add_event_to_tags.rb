class AddEventToTags < ActiveRecord::Migration[5.0]
  def change
    add_reference :tags, :event
    add_foreign_key :tags, :events
  end
end
