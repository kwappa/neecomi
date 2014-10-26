class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :employee_number
      t.string :screen_name
      t.string :screen_name_kana
      t.string :chat_id
      t.string :twitter_id
      t.string :github_id
      t.string :ghe_id
      t.string :phone_number
      t.datetime :email_confirmed_at
      
      t.timestamps null: false
    end
    add_index :users, :employee_number, unique: true
    add_index :users, :email, unique: true
    add_index :users, :name, unique: true
  end
end
