$(document).ready(function () {
  $('button').on('click', function() {
   var search_params = $('#search_field').val();
   var ajax = new Ajax('/search_results','POST',search_params)
    ajax.request().done(ajax.success)
  })

  function Ajax(url,question,params){
    this.url = url
    this.question = question
    this.params = params
  }

   Ajax.prototype = {
      request: function(){
        console.log("hello")
    var response = $.ajax({
      url: this.url,
      type: this.question,
      data: {query: this.params}
    })
      return response
      }, 

      success: function(response){
     
        artists = JSON.parse(response)
        clean_artists = artists.artists
        var delete_list = document.querySelector('.results')
      
        while(delete_list.firstChild){
          delete_list.removeChild(delete_list.firstChild)
        }

        $.each(clean_artists,function(index,value){
          single_string = value.name.replace(/\s/g, "")
          
         $('.results').append('<li><a href="artists/'+single_string+'">" '+value.name+' "</a></li>')
        })
      }
  }
});






