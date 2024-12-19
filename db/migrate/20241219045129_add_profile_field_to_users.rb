class AddProfileFieldToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :profile_url, :string
  end
end
