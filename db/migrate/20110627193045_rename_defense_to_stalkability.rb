class RenameDefenseToStalkability < ActiveRecord::Migration
  def up
    rename_column :characters, :defense, :stalkability
  end

  def down
    rename_column :characters, :stalkability, :defense
  end
end
