<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:stylesheet src="application.css"/>
    <g:layoutHead/>
</head>
<body>

  <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container-fluid">
          <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                  <span class="sr-only">Toggle Navigation</span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand">${session.user}</a>
          </div>
          <div class="collapse navbar-collapse">
              <ul class="nav navbar-nav">
                  <li >
                      <a href="/">Início</a>
                  </li>
                  <li>
                      <a href="${createLink(controller:'history', action:'history')}">Histórico</a>
                  </li>
                  <li>
                      <a href="${createLink(controller: 'user', action: 'logout')}">Logout</a>
                  </li>
              </ul>
          </div>
      </div>
  </nav>

    <g:layoutBody/>

    <!-- <div class="footer" role="contentinfo"></div> -->

    <div id="spinner" class="spinner" style="display:none;">
        <g:message code="spinner.alt" default="Loading&hellip;"/>
    </div>

    <asset:javascript src="application.js"/>

</body>
</html>
