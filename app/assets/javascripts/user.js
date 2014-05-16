// user.js
$(document).ready(function(){
  var current = null;
  $(".dropDown").click(function(){
      $(this).children(".content").slideToggle();
      if(current != this){ $(current).children(".content").slideToggle();
         current = this;}
      else current = null;
  });
});
