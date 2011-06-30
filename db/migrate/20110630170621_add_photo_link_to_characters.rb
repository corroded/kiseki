class AddPhotoLinkToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :photo_url, :string
  end
end
