helpers do
  def make_twitter
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = ENV["TWITTER_KEY"]
      config.consumer_secret = ENV["TWITTER_SECRET"]
      config.access_token        = ENV["TOKEN"]
      config.access_token_secret = ENV["TOKEN_SECRET"]
      client
    end
  end

  def more_tweets(artist)
    client = make_twitter
    client.search(artist).take(5).collect do |tweet|
         Tweet.create(
        tweet_id: tweet.id,
        url: tweet.url,
        content: client.oembed(tweet.id).html
        )
      end
    end



  def delete_older_tweets(old_tweets)
    old_tweets.each do |tweet|
      tweet.destroy
    end
  end

end

