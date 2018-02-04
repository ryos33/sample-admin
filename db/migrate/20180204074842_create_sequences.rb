class CreateSequences < ActiveRecord::Migration[5.0]
  def change
    create_table :sequences do |t|
      t.string :sequence_name, null: false
      t.integer :sequence_value, null: false

      t.timestamps
    end
    add_index :sequences, [:sequence_name], unique: true, name: 'pk_sequences'
  end
end
