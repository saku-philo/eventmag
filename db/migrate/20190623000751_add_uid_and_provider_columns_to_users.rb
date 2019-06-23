class AddUidAndProviderColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :uid, :string, default: "", null: false
    add_column :users, :provider, :string, default: "", null: false
    add_index :users, [:uid, :provider], unique: true
  end
end
