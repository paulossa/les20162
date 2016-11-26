<!DOCTYPE html>
<html lang="en">

<head>
    <title>Google Login</title>
    <meta name="google-signin-client_id" content="686461622790-esursav91456althgbjg3d2mka2gedgg.apps.googleusercontent.com">
    <script src="jquery.min.js"></script>
    <script src="https://apis.google.com/js/client:platform.js?onload=renderButton" async defer></script>
    <script>
        function onSuccess(googleUser) {
            var profile = googleUser.getBasicProfile();
            gapi.client.load('plus', 'v1', function () {
                var request = gapi.client.plus.people.get({
                    'userId': 'me'
                });
                request.execute(function (resp) {
                    var profileHTML = '<div class="profile"><div class="head">Welcome '+resp.name.givenName+'! <a href="javascript:void(0);" onclick="signOut();">Sign out</a></div>';
                    profileHTML += '<img src="'+resp.image.url+'"/><div class="proDetails"><p>'+resp.displayName+'</p><p>'+resp.emails[0].value+'</p><p>'+resp.id+'</p></div></div>';
                    sessionStorage.setItem('_profile', profileHTML);
                    window.location.href = "http://localhost:8080/foo/bar";
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
            auth2.signOut().then(function() {
                window.location.href = "index.gsp";
            });
          }
    </script>
</head>

<body>

    <div id = "prof" class="userContent"></div>
    <div id="gSignIn"><g:link controller="foo" action="bar" name="home"></g:link></div>

</body>
</html>
