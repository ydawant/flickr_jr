class CreateAlbums < ActiveRecord::Migration
  def change
  	create_table :albums do |t|
  		t.string :album_name
  		t.integer :user_id
      t.boolean :private, :default => false
  		t.timestamps
  	end
  end
end
