class AddProfileInfoToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :linkedin_url, :string
    add_column :users, :twitter_url, :string
    add_column :users, :description, :text
  end
end
