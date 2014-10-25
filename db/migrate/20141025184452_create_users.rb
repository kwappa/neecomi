class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :employee_number, null: false
      t.string :company_email, null: false
      t.string :private_email
      t.string :name, null: false
      t.string :name_kana
      t.string :nickname, null: false
      t.string :twitter_id
      t.string :github_id
      t.string :ghe_id, null: false
      t.string :phone_number

      t.timestamps null: false
    end
    add_index :users, :employee_number, unique: true
    add_index :users, :company_email, unique: true
  end
end
