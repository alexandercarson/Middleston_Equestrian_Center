// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require rails-ujs
//= require jquery.timepicker.js
//= require popper
//= require turbolinks
//= require bootstrap-sprockets
//= require jquery.mask
//= require toastr
//= require moment
//= require jquery-fileupload/basic
//= require jquery-fileupload/vendor/tmpl
//= require jquery-confirm
//= require fabric
//= require_tree .
//= jquery.uploadfile
//= require fullcalendar
//= require daterangepicker
//= require_tree .


$(document).ready(function(){
    $("#myBtn").click(function(){
      $("#myModal").modal();
    });
  });

  $(document).ready(function(){
    $("#editUserBtn").click(function(){
      $("#editUsers").modal();
    });
  });

  $(document).ready(function(){
    $('#phoneNum').mask('(000) 000-0000');
      $("#zip").mask("00000-000");
  });

  $(document).ready(function() {
    $("#problem_horse_id").on('change', function(){
      $.confirm({
        title: false,
        theme: 'supervan',
        content: 'Please press yes or hit <strong style="font-size: 20px;">Y</strong> to proceed.',
        buttons: {
              Yes: {
                  // isHidden: true, // hide the button
                  keys: ['Y'],
                  action: function () {
                      $.alert('Critical action <strong>was performed</strong>.');
                  }
              },
              No: {
                  keys: ['N'],
                  action: function () {
                      $.alert('You Clicked No.');
                  }
              },
        }
    });
    });
  });


