class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :body
      t.integer :status, default: 0
      t.integer :read
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
