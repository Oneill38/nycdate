// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require underscore
//= require jquery
//= require jquery_ujs
//= require backbone
//= require_tree .

String.prototype.generateDate = function(){
    var date = this.split("T")[0];
    var month = { "01": "January", "02": "February", "03": "March", "04": "April", "05": "May", "06": "June", "07": "July", "08": "August", "09": "September", "10": "October", "11": "November", "12": "December"};
    var my_month = date.slice(5,7);
    var event_month = month[my_month];
    var day = date.slice(8,9);
    var year = date.slice(0,4);
    var total_event_date = event_month + " " + day + ", " + year;

    return total_event_date
};

String.prototype.generateTime = function(){
    var time = this.split("T")[1];
    var min = time.slice(3,5);
    var hour = time.slice(0, 2);
    if(hour.to_i >= 13)
    {hour = hour.to_i - 12;
     time = (hour).to_s + ":" + min + " PM";
     return time;}
    else{
      time = hour + ":" + min + " AM ";
      return time;
    }
    end;
};
