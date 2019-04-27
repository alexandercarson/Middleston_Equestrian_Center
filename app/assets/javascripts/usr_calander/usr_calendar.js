var initialize_calendar;
initialize_calendar = function() {
  $('.usr_calendar').each(function(){
    var calendar = $(this);
    calendar.fullCalendar({
      themeSystem: 'bootstrap4',
      selectLongPressDelay: 1000,
      nowIndicator: true,
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,listWeek'
      },
      events: '/events.json',

      eventRender: function(event, $el) {
        $el.popover({
          title: event.title,
          content: event.description,
          delay: 250,
          trigger: 'hover',
          placement: 'top',
          container: 'body'
        })
     },
     
     eventClick: function(event, jsEvent, view ) {
      $.getScript(event.edit_url, function() {
        $('#event_date_range').val(moment(event.start).format("MM/DD/YYYY HH:mm") + ' - ' + moment(event.end).format("MM/DD/YYYY HH:mm"))
        date_range_picker();
        $('.start_hidden').val(moment(event.start).format('YYYY-MM-DD HH:mm'));
        $('.end_hidden').val(moment(event.end).format('YYYY-MM-DD HH:mm'));
      });
    }
  });
})
};
$(document).on('turbolinks:load', initialize_calendar);

