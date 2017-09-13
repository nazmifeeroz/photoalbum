class CreatePhotoAlbum < ActiveRecord::Migration[5.1]
  def change
    create_table :photo_albums do |t|

      t.string :album_name
      t.string :Description
      t.references :model, foreign_key: true

      t.timestamps
    end
  end
end
