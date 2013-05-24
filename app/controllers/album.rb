get '/albums' do
  @albums = Album.all
  erb :albums
  end

get '/albums/new' do
  erb :new_album
end

post '/albums/new' do
  @album = Album.create(:album_name => params[:album_name], :user_id => current_user.id)
  redirect '/albums'
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
  photo = Photo.new
  photo.file = params[:image]
  photo.album_id = params[:album_id]
  photo.save
  redirect "albums/#{params[:album_id]}"
end


# dfasdfas/public/

# http:localhost/uploads/images/...

# photo.url.gsub(/.*public/,'')

