class RemoveAuthorNameFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :author_name, :string
  end
end
