class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :title
      t.text :contents
      t.string :image
      t.integer :price

      t.timestamps
    end
  end
end
