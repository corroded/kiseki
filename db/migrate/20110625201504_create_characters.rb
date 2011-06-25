class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :type_id
      t.integer :hp
      t.integer :strength
      t.integer :magic
      t.integer :dexterity
      t.integer :charisma
      t.integer :intelligence
      t.integer :defense

      t.timestamps
    end
  end
end
