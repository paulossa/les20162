<!DOCTYPE html>
<html lang="en">

<html>

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="layout" content="main">
    <title>Histórico</title>
</head>

<body>
    <br>
    <a href="${createLink(controller: 'history', action: 'history')}" class="btn-sm btn-default pull-left">Semana Atual</a>
    <a href="${createLink(controller: 'history', action: 'previousWeeksHistory')}" class="btn-sm btn-default pull-left">Semanas Passadas</a>
    <br>

    <div class="panel panel-default">
        <div class="panel-heading">Total de horas investidas nesta semana: ${currentWeekHours}</div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">Ranking das atividades:</div>
        <table class="table">
            <tr>
                <th>Atividade</th>
                <th>Total de horas</th>
                <th>Proporção</th>
            </tr>
            <g:each in="${activities}">
                <tr>
                    <td>${it.title}</td>
                    <td>${it.getInvestedHours()}</td>
                    <g:if test="${currentWeekHours > 0}">
                        <td>${(it.getInvestedHours()/currentWeekHours).round(3)*100}%</td>
                    </g:if>
                    <g:else>
                        <td>0</td>
                    </g:else>
                </tr>
            </g:each>
        </table>
    </div>
</body>

</html>
