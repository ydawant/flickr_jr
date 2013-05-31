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

get '/user/:user_id/follow' do
  Following.create(:user_id => params[:user_id], :follower_id => current_user.id, :blocked => false)
  redirect "/user/#{params[:user_id]}"
end

get '/user/:user_id/unfollow' do
  Following.find_by_user_id_and_follower_id(params[:user_id], current_user.id).destroy
  redirect "/user/#{params[:user_id]}"
end

get '/user/:user_id/block' do
  follower = Following.where(:user_id => current_user.id).first_or_create(:follower_id => params[:user_id])
  follower.update_attribute(:blocked, true)
  redirect "/user/#{params[:user_id]}"
end

get '/user/:user_id/unblock' do
  follower = Following.where(:user_id => current_user.id).first_or_create(:follower_id => params[:user_id])
  follower.update_attribute(:blocked, false)
  redirect "/user/#{params[:user_id]}"
end
