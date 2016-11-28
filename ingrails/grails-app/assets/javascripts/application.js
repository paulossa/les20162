// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require jquery
//= require bootstrap
//= require_tree .
//= require_self

$(document).ready(function() {
  var btn =   $(".logout-btn");
  btn.click(function() {
    console.log('yeah');
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut()
  });

  $(".add-ti").on('click', function(){
    var activityClicked = $(this).data().activityid;
    console.log("Add to activity "+ activityClicked);
    $("#activity-id-form").val(activityClicked);
  });

  $("#activity-id-form-btn").unbind('click');

  $("#activity-id-form-btn").on('click', function(){
    var aid = $("#activity-id-form").val();
    var hours = $("input[name=ti]") .val();
    var jqxhr = $.ajax( "/timeInvested/createTi?activity.id=" + aid + "&hours=" + hours)
      .done(function() {
        $("#activity-id-form").val("");
        $("input[name=ti]") .val("0");
        location.reload();
      })
      .fail(function(data) {
        alert(data.responseJSON.message);
      })
      .always(function() {
        // $("#activity-form-dismiss").click();
      });
  });
});
