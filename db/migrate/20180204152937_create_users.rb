class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :user_no
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :last_name
      t.string :first_name
      t.string :last_kana
      t.string :first_kana
      t.string :postcode
      t.string :prefecture
      t.string :city
      t.string :address
      t.string :tel
      t.string :nickname
      t.integer :gender
      t.date :birthday

      t.timestamps
      t.datetime :deleted_at, null: false
    end

    add_index :users, [:user_no], unique: true, name: 'pk_users'
  end
end
