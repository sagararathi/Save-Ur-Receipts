get '/' do
  erb :welcome
end

get '/login' do
  erb :'auth/login'
end

post '/login' do
  user = User.find_by(username: params[:user][:username])
end

get '/signup' do

end
