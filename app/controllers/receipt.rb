# create route for display all receipts
get '/receipts' do

end
# create route for add new receipt

get '/receipts/new' do

end

post '/receipts' do

end

# create route for searching by title
get '/receipts/title' do

end

# create route for edit
get '/receipts/:id/edit' do

end

put '/receipts/:id' do

end

# create route to delete specific

delete '/receipts/:id' do

end

#create route for adding category

get '/categories/new' do
erb :'receipt/category_form'
end

post '/categories' do
 Category.create(params[:category])
 redirect '/'
end

