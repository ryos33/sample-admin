class CreateAdminPermissions < ActiveRecord::Migration[5.1]
  def change
    create_table :admin_permissions do |t|
      t.belongs_to :admin, foreign_key: false, null: false
      t.belongs_to :permission, foreign_key: false, null: false

      t.timestamps
    end
  end
end
