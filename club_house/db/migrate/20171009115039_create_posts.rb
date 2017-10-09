class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :post_title
      t.string :post_author
      t.text :post_content

      t.timestamps
    end
  end
end
