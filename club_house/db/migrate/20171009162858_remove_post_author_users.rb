class RemovePostAuthorUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :post_author
  end
end
