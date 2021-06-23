class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.references :admin, null: false, foreign_key: true
      t.string :article_title
      t.text :article_content

      t.timestamps
    end
  end
end
