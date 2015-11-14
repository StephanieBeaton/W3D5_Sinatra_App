# Homepage (Root path)

# get '/messages/:id' before the get '/messages/new'  gives Active Record errors

get '/' do
  erb :index
end
get '/messages' do
  @messages = Message.all
  erb :'messages/index'
end
get '/messages/new' do
  erb :'messages/new'
end
get '/messages/:id' do
  @message = Message.find params[:id]
  erb :'messages/show'
end
post '/messages' do
  @message = Message.new(
     title:   params[:title],
     content: params[:content],
     author:  params[:author]
   )
   if @message.save
      redirect '/messages'
   else
      erb :'messages/new'
   end
end
