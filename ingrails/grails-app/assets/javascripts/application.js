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
});
