$(document).ready(function(){
  $('#general_event_search form').on('submit', function(event){
    alert("Did this work?");
    event.preventDefault();
    var event_search_date = $('option').val();

    $.ajax({
      url: "/searches", //Routes to searches controller - not about page!
      type: 'POST',
      dataType: 'json',
      data: {date_input: event_search_date}
    }).done(function(data){
      $.each(data, function(index, value){
        var event_div = $('<div>').html(value);
        $('#general_event_results').append(event_div);
    });
  });

  });
});


