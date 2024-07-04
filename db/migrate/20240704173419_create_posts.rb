class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.references :author, null: false, foreign_key: true
      t.string :tags
      t.text :sub_text
      t.string :state

      t.timestamps
    end
  end
end
