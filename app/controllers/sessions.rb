get '/sessions/new' do
  erb :"sessions/new"
end

post '/sessions' do
  user = User.authenticate(params[:user_info])
  if user
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/sessions/new'
  end
end

delete '/sessions' do
  session[:user_id] = nil
  redirect '/'
end
