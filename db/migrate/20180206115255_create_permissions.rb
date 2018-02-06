class CreatePermissions < ActiveRecord::Migration[5.1]
  def change
    create_table :permissions do |t|
      t.string :model, null: false
      t.string :permission, null: false
      t.integer :permission_div, null: false

      t.timestamps
      t.datetime :deleted_at, null: false
    end
  end
end
