get '/users/new' do
  erb :"users/new"
end

post '/users' do
  @user = User.new(params[:user_info])
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    redirect '/users/new'
  end
end
