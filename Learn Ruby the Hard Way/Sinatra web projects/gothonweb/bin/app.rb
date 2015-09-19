require 'sinatra'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"

get '/' do
  return 'Hello world'
end

#get '/hello/' do
#  greeting = params[:greeting] || "Hi There" #Params is a function to pass variables to HTML code, greeting is a variable, used in indexs.erb
#  erb :index, :locals => {'greeting' => greeting} #indexs refers to indexs.erb in views folder.
#end

get '/hello/' do
  erb :hello_form
end

post '/hello/' do
  greeting = params[:greeting] || "Hi There"
  name = params[:name] || "Nobody"

  erb :index, :locals => {'greeting' => greeting, 'name' => name}
end

