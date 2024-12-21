class CreateArticles < ActiveRecord::Migration[8.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :url
      t.text :description
      t.text :summary
      t.boolean :published, default: false
      t.boolean :summarized, default: false

      t.timestamps
    end

    add_reference :articles, :user, null: false, foreign_key: true
    add_index :articles, :url, unique: true
  end
end
