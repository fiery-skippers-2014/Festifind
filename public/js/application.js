$(document).ready(function () {

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
        console.log(value.name)
        $('.results').append('<li>" '+value.name+' "</li>')
      })
 

     })
  })

});
