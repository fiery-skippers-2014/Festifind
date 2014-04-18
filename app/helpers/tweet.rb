helpers do
  def make_twitter
    client = Twitter::REST::Client.new do |config|
      # config.consumer_key    = ENV["TWITTER_KEY"]
      # config.consumer_secret = ENV["TWITTER_SECRET"]
      # config.access_token        = ENV["TOKEN"]
      # config.access_token_secret = ENV["TOKEN_SECRET"]
      config.consumer_key    = "XRd3BfbakPB76m67hoU2gsnxy"
      config.consumer_secret = "RaOWdyvz7Ejo6wlmxkB9nxxPw8vX39vXKEn5DwgEfoNBpYxJpP"
      config.access_token        = "229841018-CGrQkhvlpxx3POT7oDSL8KdDj3YJjrcxKBDlMAUV"
      config.access_token_secret = "D2rYWgK1UQJDEJozb23nQosusw0ytzA4zIKMaKIMJ1xcG"
      client
    end
  end

  def more_tweets(artist)
    client = make_twitter
    puts "this is ok"
    client.search(artist).take(5).collect do |tweet|
        puts "this too"
         Tweet.create(
        tweet_id: tweet.id,
        # url: tweet.url,
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

