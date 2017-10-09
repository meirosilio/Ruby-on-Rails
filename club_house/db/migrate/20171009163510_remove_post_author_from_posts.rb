class RemovePostAuthorFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :post_author, :string
  end
end
