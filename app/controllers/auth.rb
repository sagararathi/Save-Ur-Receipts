get '/' do
  erb :'index'
end

get '/login' do
  if request.xhr?
    erb :'auth/login', layout: false
  else
    erb :'auth/login'
  end
end
# create post route for user login
post '/login' do
  user = User.find_by(username: params[:user][:username])
  if user.try(:authenticate, params[:user][:password])
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/'
  end
end

get '/signup' do
# create erb and route for signup
  if request.xhr?
    erb :'auth/signup', layout: false
  else
    erb :'auth/signup'
  end
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
# add signout route for user
get '/logout' do
  session.clear
  redirect '/'
end


