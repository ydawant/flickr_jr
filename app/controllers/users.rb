get '/user/albums' do
  if current_user
    @albums = Album.where(:user_id => current_user.id)
    @sign_in = false
    erb :albums
  else
    @sign_in = true
    redirect '/login'
  end
end

get '/user/:user_id' do
  @user = User.find(params[:user_id])
  erb :user
end
