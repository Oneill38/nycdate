var Concerts = {

  populate: function(){
    $("#dates").on("click", "#concert_submit", function(event){
      $(".concertsContainer").empty();
      var startDate = $("#start").val();
      var endDate = $("#end").val();
      $.ajax({
        url: "/concerts",
        type: "GET",
        dataType: "JSON",
        data: {start: startDate, end: endDate}
      }).done(function(data){
        var concertsContainer = $("<div class='concertsContainer'>").appendTo("#dates")
        if(data.events.length > 0 == true ){
          $.each(data.events, function(k,v){
            var date = (v.datetime_local).generateDate();
            var time = (v.datetime_local).generateTime();
            $("<img>").attr("src", v.performers[0].image).appendTo(concertsContainer);
            $("<h2>").text(v.title).appendTo(concertsContainer);
            $("<h2>").text(date).appendTo(concertsContainer);
            $("<h2>").text(time).appendTo(concertsContainer);
            $("<h3>").text("Tickets from: " + "$" + v.stats.lowest_price + " - " + "$" + v.stats.highest_price).appendTo(concertsContainer);
            $("<h3>").text(v.venue.name).appendTo(concertsContainer);
            $("<h4>").text(v.venue.address).appendTo(concertsContainer);
            $("<h4>").text(v.venue.extended_address).appendTo(concertsContainer);
            $("<a>Buy Tickets</a>").attr("href", v.url).appendTo(concertsContainer);
            $("</br>").appendTo(concertsContainer);
            $("<div>").addClass("fb-send").attr({ "data-href": v.url, "data-width": "30", "data-height": "10", "data-colorscheme": "light"}).appendTo(concertsContainer);
            $("</br>").appendTo(concertsContainer);
            $("</br>").appendTo(concertsContainer);
            FB.XFBML.parse();
          });
        }else {
          $("<p>").text("No results found. Please try again.").appendTo(concertsContainer);
        }
      });
    });
  }

};




$(document).ready(function(){
  Concerts.populate();
})


