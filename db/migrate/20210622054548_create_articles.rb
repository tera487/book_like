class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.references :admin, null: false, foreign_key: true
      t.string :article_title, null: false
      t.text :article_content, null: false

      t.timestamps
    end
  end
end
