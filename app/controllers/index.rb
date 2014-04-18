get '/' do

   # @artist = MetaSpotify::Artist.lookup('spotify:artist:4YrKBkKSVeqDamzBPWVnSJ', :extras => 'album')

    # ap @artist.albums.first.name
  # @search = MetaSpotify::Artist.search('rush')[:artists][0]
  # ap @search

   # ap @artist.albums.first.name
    @current = session[:user_id]
    @all_users = User.all

  erb :index
end

# get '/search' do
#   erb :search
# end

post '/search_results' do
  query = params['query']

  artists = MetaSpotify::Artist.search(query)

  top_10_artists = artists[:artists][0..2]
  # [0..10]
  ap top_10_artists
  {artists: top_10_artists}.to_json
end

#----------- SESSIONS -----------

get '/sessions/new' do
  erb :_log_in
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
  session[:user_id] = nil
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

#-----------------Artists------------

get '/artists/:artist_name' do
  # Gets the artist name
  @musician = params[:artist_name]
  puts @musician

  # Updates the twitter feed with the info
  #deletes the older ones
  # @tweets = Tweet.where(["created_at < ?", 1.minute.ago])
  #  delete_older_tweets(@tweets)
  #  puts params[:artist_name].class

   #gets some new ones
    # more_tweets(params[:artist_name])


  erb :fan_page
end

#------------------Tweet------------

get '/tweet' do

  #for debugging purposes
  puts "gets to the route"

  random_number = (0..4).to_a.sample
 @tweets = Tweet.all
 puts @tweets[random_number]
 @tweet = @tweets[random_number]
 puts @tweet.content
 @tweet.to_json
end


