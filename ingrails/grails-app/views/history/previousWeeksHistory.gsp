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
    <br><br>

    <div class="panel panel-default">
        <div class="panel-heading">Total de horas investidas nesta semana: ${currentWeekHours}</div>
        <div class="panel-heading">Total de horas investidas semana passada: ${week1Hours}</div>
        <div class="panel-heading">Total de horas investidas semana retrasada: ${week2Hours}</div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">Ranking das atividades:</div>
        <table class="table">
            <tr>
                <th>Atividade</th>
                <th>Total de horas</th>
                <th>Proporção</th>
            </tr>
            <script>console.log('${currentActivities}');</script>
            <g:each in="${currentActivities}">
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
        <br>
        <h1>Semana Passada</h1>
        <br>
        <table class="table">
            <tr>
                <th>Atividade</th>
                <th>Total de horas</th>
                <th>Proporção</th>
            </tr>
            <g:each in="${activitiesWeek1}">
                <tr>
                    <td>${it.title}</td>
                    <td>${it.getInvestedHours()}</td>
                    <g:if test="${week1Hours > 0}">
                        <td>${(it.getInvestedHours()/week1Hours).round(3)*100}%</td>
                    </g:if>
                    <g:else>
                        <td>0</td>
                    </g:else>
                </tr>
            </g:each>
        </table>
        <br>
        <h1>Semana Retrasada</h1>
        <br>
        <table class="table">
            <tr>
                <th>Atividade</th>
                <th>Total de horas</th>
                <th>Proporção</th>
            </tr>
            <g:each in="${activitiesWeek2}">
                <tr>
                    <td>${it.title}</td>
                    <td>${it.getInvestedHours()}</td>
                    <g:if test="${week2Hours > 0}">
                        <td>${(it.getInvestedHours()/week2Hours).round(3)*100}%</td>
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
