class RenameIntelligenceToWit < ActiveRecord::Migration
  def up
    rename_column :characters, :intelligence, :wit
  end

  def down
    rename_column :characters, :wit, :intelligence
  end
end
