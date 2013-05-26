get '/albums' do
  if current_user
    @albums = Album.where(:user_id => current_user.id)
    @sign_in = false
    erb :albums
  else
    @sign_in = true
    redirect '/login'
  end
end

get '/albums/new' do
  erb :new_album
end

post '/albums/new' do
  @album = Album.create(:album_name => params[:album_name], :user_id => current_user.id)
  redirect "/albums/#{@album.id}/upload"
end


get '/albums/:album_id' do
  @album = Album.find(params[:album_id])
  erb :album_show
end

get '/albums/:album_id/upload' do
 @album = Album.find(params[:album_id])
 erb :upload
end

post '/albums/:album_id/upload' do
  params[:image].each do |k, v|
    photo = Photo.new
    photo.file = v
    photo.album_id = params[:album_id]
    photo.save
  end
  redirect "albums/#{params[:album_id]}"
end

post '/albums/:album_id/photo/:photo_id' do
  photo = Photo.find(params[:photo_id])
  photo.update_attributes(:likes => photo.likes.to_i + 1)

  content_type :json
  {'likes' => photo.likes}.to_json
end
