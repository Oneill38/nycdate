var Theater = {

  populate: function(){
    $("#theaterDates").on("click", "#theater_submit", function(event){
      $(".theaterContainer").empty();
      var startDate = $("#start").val();
      var endDate = $("#end").val();

      $.ajax({
        url: "/theaters",
        type: "GET",
        dataType: "JSON",
        data: {start: startDate, end: endDate}
      }).done(function(data){
        var theaterContainer = $("<div class='theaterContainer'>").appendTo("#theaterDates");
        if(data.events.length > 0){
          $.each(data.events, function(k,v){
            $("<img>").attr("src", v.performers[0].image).appendTo(theaterContainer);
            $("<h2>").text(v.title).appendTo(theaterContainer);
            $("<h2>").text(v.datetime_local).appendTo(theaterContainer);
            $("<h3>").text("Tickets from: " + "$" + v.stats.lowest_price + " - " + "$" + v.stats.highest_price).appendTo(theaterContainer);
            $("<h3>").text(v.venue.name).appendTo(theaterContainer);
            $("<h4>").text(v.venue.address).appendTo(theaterContainer);
            $("<h4>").text(v.venue.extended_address).appendTo(theaterContainer);
            $("<a>Buy Tickets</a>").attr("href", v.url).appendTo(theaterContainer);
            $("</br>").appendTo(theaterContainer);
            $("<div>").addClass("fb-send").attr({ "data-href": v.url, "data-width": "30", "data-height": "10", "data-colorscheme": "light"}).appendTo(theaterContainer);
            $("</br>").appendTo(theaterContainer);
            $("</br>").appendTo(theaterContainer);
            FB.XFBML.parse();
          });
        }else {
          $("<p>").text("No results found. Please try again.").appendTo(theaterContainer);
        }
      });
    });
  }

};

$(document).ready(function(){
  Theater.populate();
})
