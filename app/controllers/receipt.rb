# create route for display all receipts
get '/receipts' do
  @receipts = Receipt.all
  erb :'receipt/showAll'
end
# create route for add new receipt

get '/receipts/new', auth: :user do
  @categories = Category.all
  erb :'receipt/receipt_form'
end

post '/receipts', auth: :user do
  receipt = Receipt.new(params[:receipt])
  receipt.update_attributes(params[:category])
  receipt.user = current_user
  receipt.save
  redirect '/'
end

# create route for searching by title
get '/receipts/search' do
  erb :'receipt/searchbox'
end

get'/receipts/:id'do
  receipt = Receipt.find(params[:receipt][:id])
  erb :'receipt/show', locals: {receipt: receipt}
end

# create route for edit
get '/receipts/:id/edit' do

end

put '/receipts/:id' do

end

# create route to delete specific

delete '/receipts/:id' do id
  receipt = Receipt.find(id)
  receipt.destroy
end

#create route for adding category

get '/categories/new', auth: :user do
erb :'receipt/category_form'
end

post '/categories', auth: :user do
 Category.create(params[:category])
 redirect '/'
end

