class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :user_id
      t.string :title
      t.integer :pages
      t.integer :isbn10
      t.string :language
      t.string :description
      t.date :releasedate

      t.timestamps
    end
    add_index :books, [:user_id, :created_at]
  end
end
