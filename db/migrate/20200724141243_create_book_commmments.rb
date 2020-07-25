class CreateBookCommmments < ActiveRecord::Migration[5.2]
  def change
    create_table :book_commmments do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
