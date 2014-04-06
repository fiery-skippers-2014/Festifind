get '/' do	
	 @current = session[:user_id]
	@all_users = User.all	
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  erb :sign_in 
end

post '/sessions' do
  @valid_user = User.authenticate_user(params[:email], params[:password])
 	if @valid_user != nil
 		session[:user_id] = @valid_user.id
 	end	
  redirect '/'
end

delete '/sessions/:id' do
  session.clear
  redirect '/'
end

#----------- USERS -----------

get '/users/new' do
  erb :sign_up
end

post '/users' do
  @user = User.new(params[:user])
  @user.password = params[:password]
  @user.save
end
