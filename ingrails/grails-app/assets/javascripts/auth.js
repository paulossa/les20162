$(document).ready(function() {

  function onSuccess(googleUser) {
      var profile = googleUser.getBasicProfile();
      gapi.client.load('plus', 'v1', function () {
          var request = gapi.client.plus.people.get({
              'userId': 'me'
          });
          request.execute(function (resp) {
              if (resp.id) {
                $('input[name=givenName]').val(resp.name.givenName);
                $('input[name=displayName]').val(resp.displayName);
                $('input[name=picUrl]').val(resp.image.url);
                $('input[name=email]').val(resp.emails[0].value);
                $('input[name=id]').val(resp.id);
                $('form').submit()
              }
          });
      });
  }

  function onFailure(error) {
      alert(error);
  }

  function renderButton() {
      gapi.signin2.render('gSignIn', {
          'scope': 'profile email',
          'width': 240,
          'height': 50,
          'longtitle': true,
          'theme': 'dark',
          'onsuccess': onSuccess,
          'onfailure': onFailure
      });
  }

  function signOut() {
      var auth2 = gapi.auth2.getAuthInstance();
      auth2.signOut();
  }
})
