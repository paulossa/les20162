<!DOCTYPE html>
<html lang="en">

<head>
    <title>Google Login</title>
    <meta name="google-signin-client_id" content="686461622790-esursav91456althgbjg3d2mka2gedgg.apps.googleusercontent.com">
    <script src="jquery.min.js"></script>
    <asset:javascript src="jquery-2.2.0.min.js"/>
    <script src="https://apis.google.com/js/client:platform.js?onload=renderButton" async defer></script>
    <script>
    function onSuccess(googleUser) {
        var profile = googleUser.getBasicProfile();
        gapi.client.load('plus', 'v1', function () {
            var request = gapi.client.plus.people.get({
                'userId': 'me'
            });
            request.execute(function (resp) {
                //var profileHTML = '<div class="profile"><div class="head">Welcome '+resp.name.givenName+'! <a href="javascript:void(0);" onclick="signOut();">Sign out</a></div>';
                //profileHTML += '<img src="'+resp.image.url+'"/><div class="proDetails"><p>'+resp.displayName+'</p><p>'+resp.emails[0].value+'</p><p>'+resp.id+'</p></div></div>';
                // document.getElementById('prof').innerHTML = profileHTML;
                // document.getElementById('gSignIn').style.display = 'none';

                if (resp.name.givenName) {
                  $('input[name=givenName]').val(resp.name.givenName);
                  $('input[name=displayName]').val(resp.displayName);
                  $('input[name=picUrl]').val(resp.image.url);
                  $('input[name=email]').val(resp.emails[0].value);
                  $('input[name=id]').val(resp.id);
                  // $('form').submit()
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
        auth2.signOut().then(function() {

          $.ajax({url: "${createLink(controller: 'user', action: 'logout')}", success: function(result){
            console.log("User logged out");
          }});
          document.getElementById('prof').innerHTML = '';
          document.getElementById('gSignIn').style.display = 'block';

          // TO-DO logout from server as well
        });
      }
    </script>
</head>

<body>
    <div id="gSignIn"></div>

    <div id = "prof" class="userContent"></div>

    <g:form action="authenticate">
      <input type="hidden" name="givenName" value="">
      <input type="hidden" name="displayName" value="">
      <input type="hidden" name="picUrl" value="">
      <input type="hidden" name="email" value="">
      <input type="hidden" name="id" value="">
      <input type="submit" value="Login">
    </g:form>

    <style>
        .profile {
            border: 3px solid #B7B7B7;
            padding: 10px;
            margin-top: 10px;
            width: 350px;
            background-color: #F7F7F7;
            height: 160px;
        }

        .profile p {
            margin: 0px 0px 10px 0px;
        }

        .head {
            margin-bottom: 10px;
        }

        .head a {
            float: right;
        }

        .profile img {
            width: 100px;
            float: left;
            margin: 0px 10px 10px 0px;
        }

        .proDetails {
            float: left;
        }
    </style>
</body>
</html>
