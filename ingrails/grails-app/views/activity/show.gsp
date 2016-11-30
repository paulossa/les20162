<!DOCTYPE html>
<html lang="en">

<html>

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'activity.label', default: 'Activity')}"/>
    <title>Detalhes da atividade</title>
</head>

<body>

    <div class="conteiner-fluid">

        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

                <a href="#show-activity" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
                <div class="nav" role="navigation"></div>
                <g:if test="${flash.message}">
                    <div class="message" role="status">${flash.message}</div>
                </g:if>

                <br>
                <div class="panel panel-default" style="margin: 5%">
                      <div class="panel-heading">Detalhes da atividade:</div>
                      <table class="table">
                        <tr>
                            <th>Título:</th>
                            <td>${activity.title}</td>
                        </tr>
                        <tr>
                            <th>Descrição:</th>
                            <td>${activity.description}</td>
                        </tr>
                        <tr>
                            <th>Categoria:</th>
                            <td>${activity.category}</td>
                        </tr>
                        <!-- <tr>
                            <th>Tags:</th>
                            <td>${activity.tags}</td>
                        </tr> -->
                        <tr>
                            <th>Dono:</th>
                            <td>${activity.owner}</td>
                        </tr>
                        <tr>
                            <th>Tis:</th>
                            <td><f:display bean="activity" property="tis"/></td>
                        </tr>
                      </table>
                </div>
            </div>
        </div>
    </div>

</body>

</html>
