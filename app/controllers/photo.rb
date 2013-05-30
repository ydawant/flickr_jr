get '/photo/destroy/:photo_id' do
  photo = Photo.find(params[:photo_id])
  album =Album.find(photo.album_id)
  photo.destroy

  redirect "/albums/#{album.id}/edit_album"
end
