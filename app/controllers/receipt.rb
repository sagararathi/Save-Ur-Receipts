# create route for display all receipts
get '/receipts' do

end
# create route for add new receipt

get '/receipts/new', auth: :user do
  @categories = Category.all
  erb :'receipt/receipt_form'
end

post '/receipts', auth: :user do
receipt = Receipt.new( title: params[:receipt][:title],
                       content: params[:receipt][:content],
                       url: params[:receipt][:url],
                       category_id: params[:category][:category_id],
                       user_id: current_user.id)
redirect '/'
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

get '/categories/new', auth: :user do
erb :'receipt/category_form'
end

post '/categories', auth: :user do
 Category.create(params[:category])
 redirect '/'
end

