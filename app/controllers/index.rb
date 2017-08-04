get '/' do
  if logged_in?
    erb :"index"
  else
    erb :"about"
  end
end

get '/about' do
  erb :"about"
end
