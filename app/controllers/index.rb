get '/' do

   # @artist = MetaSpotify::Artist.lookup('spotify:artist:4YrKBkKSVeqDamzBPWVnSJ', :extras => 'album')
    # ap @artist.albums.first.name
  @search = MetaSpotify::Artist.search('rush')[:artists][0]
  ap @search


   # ap @artist.albums.first.name
   @current = session[:user_id]
  @all_users = User.all
  erb :index
end

get '/search' do
  erb :search
end

post '/search_results' do
  query = params['query']
  albums = MetaSpotify::Album.search(query)
  JSON.dump({albums: albums[:albums].map(&:name)})
end

#----------- SESSIONS -----------

get '/sessions/new' do
  erb :sign_in
end

post '/sessions' do

  # @valid_user = User.authenticate_user(params[:email], params[:password])
  @person = User.find_by_email(params[:email])

  if @person.password == params[:password]
    session[:user_id] = @person.id

  end


  # puts @valid_user
  # if @valid_user != nil
  #   puts "logged in"
  #   session[:user_id] = @valid_user.id
  # end
  # puts "did not login"
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
  @user = User.new(params)
  @user.password = params[:password]
  @user.save
  redirect '/'
end
