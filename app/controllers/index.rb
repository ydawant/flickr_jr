get '/' do
  @photos = Photo.all
  @albums = Album.all
  erb :index
end


