class CreatePhoto < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|

      t.string :photo_name
      t.string :date
      t.string :description

      t.references :album, foreign_key: true

      t.timestamps
    end
  end
end
