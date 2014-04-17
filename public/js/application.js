$(document).ready(function () {

  // Optional - Use AJAX to send an HTTP DELETE request for the sign-out link
  $('button').on('click', function() {
    var search_params = $('#search_field').val();

    $.ajax({
      url: '/search_results',
      type: 'POST',
      data: {query: search_params }
    // }).done(function(response) {
    //   $.parseJSON(response).albums.forEach(function(album){
    //     $('.results').append('<li>' + album + '</li>')
    //   })
    // })
  });
  });

});
