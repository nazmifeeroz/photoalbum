class AddPrivateToAlbums < ActiveRecord::Migration[5.1]
  def change
  	add_column :albums, :private, :integer
  end
end
