class Posts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :content, null: false
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false

      t.timestamps
    end
    add_foreign_key :posts, :books, column: :book_id , primary_key: :isbn
  end
end
