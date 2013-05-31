get '/albums/new' do
  erb :new_album
end

get '/albums/upload' do
 erb :upload
end

post '/albums/upload' do
  params[:private] == "true" ? @private = true : @private = false; 
  album = Album.create(:album_name => params[:album_name], :user_id => current_user.id, :private => @private)
  params[:image].each do |k, v|
    photo = Photo.new
    photo.file = v
    photo.album_id = album.id
    photo.save
  end
  redirect "albums/#{album.id}"
end

get '/albums/:album_id/edit_album' do
  @album = Album.find(params[:album_id])
  erb :edit_album
end

get '/albums/:album_id/edit' do
 @album = Album.find(params[:album_id])
 erb :upload_more
end

post '/albums/:album_id/edit' do
  params[:private] == "true" ? @private = true : @private = false; 
  album = Album.find(params[:album_id])
  album.update_attributes(:album_name => params[:album_name], :private => @private)
  if params[:image] != nil
    params[:image].each do |k, v|
      photo = Photo.new
      photo.file = v
      photo.album_id = params[:album_id]
      photo.save
    end
  end
redirect "albums/#{params[:album_id]}"
end

get '/albums/:album_id' do
  @album = Album.find(params[:album_id])
  erb :album_show
end

get '/albums/:album_id/photo/:photo_id' do
  if Like.find_by_user_id_and_photo_id(current_user.id,params[:photo_id]) == nil
  Like.create(:user_id => current_user.id, :photo_id => params[:photo_id])
  end
  redirect "/albums/#{params[:album_id]}"
end

get "/albums/:album_id/photo/:photo_id/dislike" do
  Like.find_by_user_id_and_photo_id(current_user.id,params[:photo_id]).destroy
  redirect "/albums/#{params[:album_id]}"
end

post '/albums/:album_id/photo/:photo_id' do
  if Like.find_by_user_id_and_photo_id(current_user.id,params[:photo_id]) == nil
  Like.create(:user_id => current_user.id, :photo_id => params[:photo_id])
  end
  photo = Photo.find(params[:photo_id])
  photo_length = photo.likes.length
  album = Album.find(photo.album_id)
  content_type :json
  {'likes' => "#{photo_length}", 'album_id' => "#{album.id}", 'photo_id' => "#{photo.id}" }.to_json
end

post "/albums/:album_id/photo/:photo_id/dislike" do
  Like.find_by_user_id_and_photo_id(current_user.id,params[:photo_id]).destroy
  photo = Photo.find(params[:photo_id])
  photo_length = photo.likes.length
  album = Album.find(photo.album_id)
  content_type :json
  {'likes' => "#{photo_length}", 'album_id' => "#{album.id}", 'photo_id' => "#{photo.id}" }.to_json
end
