var Sports = {

  populate: function(){
    $("#sportsDates").on("click", "#sport_submit", function(event){
      $(".sportsContainer").empty();
      var startDate = $("#start").val();
      var endDate = $("#end").val();
      $.ajax({
        url: "/sports",
        type: "GET",
        dataType: "JSON",
        data: {start: startDate, end: endDate}
      }).done(function(data){
        var sportsContainer = $("<div class='sportsContainer'>").appendTo("#sportsDates")
        if(data.events.length > 0 == true ){
          $.each(data.events, function(k,v){
            $("<img>").attr("src", v.performers[0].image).appendTo(sportsContainer);
            $("<h2>").text(v.title).appendTo(sportsContainer);
            $("<h2>").text(v.datetime_local).appendTo(sportsContainer);
            $("<h3>").text("Tickets from: " + "$" + v.stats.lowest_price + " - " + "$" + v.stats.highest_price).appendTo(sportsContainer);
            $("<h3>").text(v.venue.name).appendTo(sportsContainer);
            $("<h4>").text(v.venue.address).appendTo(sportsContainer);
            $("<h4>").text(v.venue.extended_address).appendTo(sportsContainer);
            $("<a>Buy Tickets</a>").attr("href", v.url).appendTo(sportsContainer);
            $("</br>").appendTo(sportsContainer);
            $("<div>").addClass("fb-send").attr({ "data-href": v.url, "data-width": "30", "data-height": "10", "data-colorscheme": "light"}).appendTo(sportsContainer);
            $("</br>").appendTo(sportsContainer);
            $("</br>").appendTo(sportsContainer);
            FB.XFBML.parse();
        });
        }else {
          $("<p>").text("No results found. Please try again.").appendTo(sportsContainer);
        }
      });
    });
  }

};

$(document).ready(function(){
  Sports.populate();
})
