get '/' do
  # render home page
 #TODO: Show all users if user is signed in
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  erb :sign_in 
end

post '/sessions' do
  @valid_user = User.authenticate_user(params[:email], params[:password])
 	p @valid_user
  erb :index
end

delete '/sessions/:id' do
  # sign-out -- invoked 
end

#----------- USERS -----------

get '/users/new' do
  erb :sign_up
end

post '/users' do
  @user = User.new(params[:user])
  # @user.password = params[:password]
  @user.save
end
