
// Leave for fixing later....

// $(document).ready(function(){
//   $('#general_event_search form').on('submit', function(event){
//     // alert("Did this work?");
//     event.preventDefault();
//     var event_search_date = $('option').val();

//     $.ajax({
//       url: "/searches", //searches controller - not about page!
//       type: 'POST',
//       dataType: 'json',
//       data: {date_input: event_search_date}
//     }).done(function(data){
//       $.each(data, function(index, value){
//         var event_div = $('<div>').text(value);
//         $('#general_event_results').append(event_div);
//     });
//   });

//   });
// });

(function($) {
    $(document).ready(function () {

    $('.send').click(function() {
        setTimeout(function() {
            $('#plate').removeClass('front');
            $('#container').removeClass('beginning');
            $('.curvable').addClass('curved');
            setTimeout(function() {
                $('#container').addClass('hover');
                setTimeout(function() {
                    $('#container').addClass('fly_away_first');
                    setTimeout(function() {
                        $('#container').addClass('fly_away');
                        setTimeout(function(){
                            $('#plate').addClass('front');
                            $('#container').removeClass('fly_away fly_away_first hover').addClass('beginning');
                            $('.curvable').removeClass('curved');
                        },3000);
                    }, 600);
                }, 2000);
            }, 2800);
        }, 200);
    });

        /*-------------------- EXPANDABLE PANELS ----------------------*/
        var panelspeed = 500; //panel animate speed in milliseconds
        var totalpanels = 3; //total number of collapsible panels
        var defaultopenpanel = 0; //leave 0 for no panel open
        var accordian = false; //set panels to behave like an accordian, with one panel only ever open at once

        var panelheight = new Array();
        var currentpanel = defaultopenpanel;
        var iconheight = parseInt($('.icon-close-open').css('height'));
        var highlightopen = true;
        var num = -100;

        //Initialise collapsible panels
        function panelinit() {
            for (var i=1; i<=totalpanels; i++) {
                panelheight[i] = parseInt($('#cp-'+i).find('.expandable-panel-content').css('height'));
                $('#cp-'+i).find('.expandable-panel-content').css('margin-top', -panelheight[i]);
                if (defaultopenpanel == i) {
                    $('#cp-'+i).find('.icon-close-open').css('background-position', '0px -'+iconheight+'px');
                    $('#cp-'+i).find('.expandable-panel-content').css('margin-top', 0);
                }
            }
        }

        $('.expandable-panel-heading').click(function() {
            var obj = $(this).next();
            var objid = parseInt($(this).parent().attr('ID').substr(3,2));
            currentpanel = objid;
            if (accordian == true) {
                resetpanels();
            }

            if (parseInt(obj.css('margin-top')) <= (panelheight[objid]*-1)) {
                obj.clearQueue();
                obj.stop();
                obj.prev().find('.icon-close-open').css('background-position', '0px -'+50+'px');
                obj.animate({'margin-top':0}, panelspeed);
                if (highlightopen == true) {
                    $('#cp-'+currentpanel + ' .expandable-panel-heading').addClass('header-active');
                }
            } else {
                obj.clearQueue();
                obj.stop();
                obj.prev().find('.icon-close-open').css('background-position', '0px 0px');
                obj.animate({'margin-top':(panelheight[objid]*-1)}, panelspeed);
                if (highlightopen == true) {
                    $('#cp-'+currentpanel + ' .expandable-panel-heading').removeClass('header-active');
                }
            }
        });

        function resetpanels() {
            for (var i=1; i<=totalpanels; i++) {
                if (currentpanel != i) {
                    $('#cp-'+i).find('.icon-close-open').css('background-position', '0px 0px');
                    $('#cp-'+i).find('.expandable-panel-content').animate({'margin-top':-panelheight[i]}, panelspeed);
                    if (highlightopen == true) {
                        $('#cp-'+i + ' .expandable-panel-heading').removeClass('header-active');
                    }
                }
            }
        }


        $(window).load(function() {
            panelinit();
        }); //END LOAD
    }); //END READY
})(jQuery);


