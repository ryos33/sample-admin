class DeviseCreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      # original attr
      t.integer :admin_no
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :last_kana, null: false
      t.string :first_kana, null: false
      t.string :nickname, null: false

      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at


      t.timestamps null: false
      t.datetime :deleted_at, null: false
    end

    add_index :admins, [:admin_no],                          unique: true, name: 'pk_admins'
    add_index :admins, [:email, :deleted_at],                unique: true, name: 'uq_email'
    add_index :admins, [:reset_password_token, :deleted_at], unique: true, name: 'uq_reset_password_token'
    # add_index :admins, [:unlock_token, :deleted_at],         unique: true, name: 'uq_unlock_token'
  end
end
