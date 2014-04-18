// Get Tweet via an ajax call
function getTweet() {
    $.ajax({
        url:'/tweet',
        type: 'get',
        datatype: 'json'
    }).done(function(tweet) {
        console.log(tweet)
        doTweet(tweet)
    })
};

// place the tweet in a box
function placeContent(content) {
  console.log("does not get here")
    $("#tweetbox").hide().html(content).fadeIn(500);
}

// parses a tweet after the ajax request
function doTweet(tweet) {
     console.log("it fails here")
    var jaySon = JSON.parse(tweet);
    console.log(jaySon)
    placeContent(jaySon.content);

    // puts it in the map
    // var myCatlng = new google.maps.LatLng(parseFloat(jaySon.tweet.lat), parseFloat(jaySon.tweet.long));
    // var newMarker = placeMarker(myCatlng, "hi");
    // placeTurnup(newMarker, jaySon.tweet.content);
}

looping = null;

function groupyLoop() {
    if (!looping) {
        $('#artistLoop').html("#groupyOff");

        looping = setInterval(function() {
            getTweet()
        }, 5000);
    } else {
        $('#artistLoop').html("#groupyOn");
        window.clearInterval(looping);
        looping = null;
    }
}





// all the javascript calls for the twitter feed
$(document).ready(function () {

     // fetches the initial tweet
     // getTweet();

      // starts the twitter feed loop
     $(document).on('click',".button", function() {
        console.log("clicked loop");
        getTweet();
        groupyLoop();
    })





  // Optional - Use AJAX to send an HTTP DELETE request for the sign-out link
  $('button').on('click', function() {
    var search_params = $('#search_field').val();

    $.ajax({
      url: '/search_results',
      type: 'POST',
      data: {query: search_params }

    })
     .done(function(response) {
      artists = JSON.parse(response)
      clean_artists = artists.artists
      var delete_list = document.querySelector('.results')

      while(delete_list.firstChild){
        delete_list.removeChild(delete_list.firstChild)
      }

      $.each(clean_artists,function(index,value){
        single_string = value.name.replace(/\s/g, "")
        console.log(value.name)
        $('.results').append('<li><a href="artists/'+single_string+'">" '+value.name+' "</a></li>')
      })

     })
  })
});



