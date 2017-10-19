class AddIndexToEvents < ActiveRecord::Migration[5.1]
  def change
    add_index :events, :creator_id
  end
end
