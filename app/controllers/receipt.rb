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
  redirect '/receipts'
end

# create route for searching by title
get '/receipts/search' do
  if request.xhr?
    erb :'receipt/searchbox', layout: false
  else
    erb :'receipt/searchbox'
  end
end

get '/receipts/performsearch', auth: :user do
  receipt = Receipt.find(params[:receipt_id])
  # if request.xhr?
  #   redirect "/receipts/#{receipt.id}", layout: false
  # else
    redirect "/receipts/#{receipt.id}"
  # end
end

get '/receipts/:id' do
  receipt = Receipt.find(params[:id])
  erb :'receipt/show', locals: {receipt: receipt}
end

# create route for edit
get '/receipts/:id/edit', auth: :user do |id|
  receipt = Receipt.find(id)
  @categories = Category.all
  if request.xhr?
    erb :'receipt/edit', locals: {receipt: receipt}, layout: false
  else
    erb :'receipt/edit', locals: {receipt: receipt}
  end
end

put '/receipts/:id' do |id|
  receipt = Receipt.find(id)
  receipt.update(params[:receipt])
  receipt.update_attributes(params[:category])
  redirect'/receipts'
end

# create route to delete specific

delete '/receipts/:id', auth: :user do |id|
  receipt = Receipt.find(id)
  receipt.destroy
  if request.xhr?
    "delete"
  else
    redirect'/receipts'
  end
end

#create route for adding category

get '/categories/new', auth: :user do
erb :'receipt/category_form'
end

post '/categories', auth: :user do
 Category.create(params[:category])
 redirect '/'
end

