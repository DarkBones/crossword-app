class CreateWords < ActiveRecord::Migration[6.0]
  def change
    create_table :words do |t|
    	t.string :answer, null: false
    	t.string :clue, null: false
    	t.integer :length, null: false
    	t.string :uuid, null: false
      t.timestamps
    end

    add_index :words, :uuid
    add_index :words, :length
  end
end