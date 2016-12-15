<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'timeInvested.label', default: 'TimeInvested')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <a href="#show-timeInvested" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
        <div class="nav" role="navigation">
        </div>
        <div id="show-timeInvested" class="content scaffold-show" role="main">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
            </g:if>

            <br>
            <div class="panel panel-default" style="margin: 5%">
                  <div class="panel-heading">Detalhes do tempo investido:</div>
                  <table class="table">
                    <tr>
                        <th>Horas:</th>
                        <td>${timeInvested.hours}</td>
                    </tr>
                    <tr>
                        <th>Data de criação:</th>
                        <td>${timeInvested.dateCreated}</td>
                    </tr>
                    <tr>
                        <th>Última atualização:</th>
                        <td>${timeInvested.lastUpdated}</td>
                    </tr>
                    <tr>
                        <th>Tarefa:</th>
                        <td><f:display bean="timeInvested" property="activity"/></td>
                    </tr>
                  </table>
            </div>
        </div>
    </body>
</html>
