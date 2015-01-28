get '/' do
  erb :welcome
end

get '/login' do
  erb :'auth/login'
end
# create post route for user login
post '/login' do
  user = User.find_by(username: params[:user][:username])
  if user.try(:authtecation, params[:user][:password])
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/'
  end
end

get '/signup' do
# create erb and route for signup
erb :'auth/signup'
end

#add post route for signup
post '/signup' do
  user =User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    # if time permits will add error handling code
    redirect '/'
  end
end


