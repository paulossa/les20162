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

  $("#reminder-add-ti-btn").on('click', function() {
    var aid = $("#activity-id-form").val();
    var hours = $("input[name=ti]") .val();
    var jqxhr = $.ajax( "/timeInvested/addTiYesterday?activity.id=" + aid + "&hours=" + hours)
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

function filterTable(tableId) {
  // Declare variables
  console.log(tableId);
  var input, filter, table, tr, td, i;
  input = document.getElementById("filtro");
  filter = input.value.toUpperCase();
  marker = document.getElementById("group_marker");
  table = document.getElementById(tableId);
  tr = table.getElementsByTagName("tr");
  if(filter == "ALL"){
    for (i = 0; i < tr.length; i++) {
      tr[i].style.display = "";
      marker.innerHTML = "";
    }
    return
  }

  marker.innerHTML = "Agrupado por" + filter;
  
  
  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td != undefined) {
      if (td.innerHTML.toUpperCase().split(",").indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }
  }
}
