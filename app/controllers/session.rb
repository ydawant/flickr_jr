get '/new' do
  erb :new
end

post '/new' do
  user = User.create(params[:user])
  session[:user_id] = user.id
  redirect '/'
end

get '/login' do
  erb :login
end

post '/login' do
  if @user = User.authenticate(params[:user])
    session[:user_id] = @user.id
    @session = session
    redirect '/'
  else
    erb :failed_login
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
