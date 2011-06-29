class RemoveExtraStats < ActiveRecord::Migration
  def up
    remove_column :characters, :hp
    remove_column :characters, :strength
    remove_column :characters, :magic
    remove_column :characters, :dexterity
  end

  def down
    add_column :characters, :hp, :integer
    add_column :characters, :strength, :integer
    add_column :characters, :magic, :integer
    add_column :characters, :dexterity, :integer
  end
end
