get '/new' do
  erb :new
end

post '/new' do
  user = User.create(params[:user])
  session[:user_id] = user.id
  if user.errors.messages.length > 0
    @errors = user.errors.messages
    erb :new
  else
    redirect "/user/#{user.id}"
  end
end

get '/login' do
  erb :login
end

post '/login' do
  if @user = User.authenticate(params[:user])
    session[:user_id] = @user.id
    @session = session
    @fail = false
    redirect '/'
  else
    @fail = true
    erb :login
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
