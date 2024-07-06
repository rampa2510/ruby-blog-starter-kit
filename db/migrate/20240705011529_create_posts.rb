class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :sub_text
      t.string :status
      t.references :author, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end

    create_join_table :posts, :tags do |t|
      t.index %i[post_id tag_id]
      t.index %i[tag_id post_id]
    end
  end
end
