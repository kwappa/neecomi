class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :member_number
      t.string :screen_name
      t.string :screen_name_kana
      t.string :nick
      t.text   :profile
      t.datetime :email_confirmed_at

      t.timestamps null: false
    end
    add_index :users, :member_number, unique: true
    add_index :users, :email, unique: true
    add_index :users, :name, unique: true
  end
end
