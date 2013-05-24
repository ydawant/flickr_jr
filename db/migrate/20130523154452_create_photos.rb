class CreatePhotos < ActiveRecord::Migration
  def change
  	create_table :photos do |t|
  		t.string :file
  		t.integer :album_id
  		t.timestamps
  	end
  end
end
