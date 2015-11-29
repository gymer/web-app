class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true
      t.string :server_access_token
      t.string :client_access_token

      t.timestamps null: false
    end

    add_index :apps, :server_access_token, unique: true
    add_index :apps, :client_access_token, unique: true
  end
end
