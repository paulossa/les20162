<!DOCTYPE html>
<html lang="en">

<html>

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="layout" content="main">
    <title>Histórico</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script>
        $(function() {
            Highcharts.chart('container', {
                title: {
                    text: 'Atividade Semanal',
                    x: -20 //center
                },
                xAxis: {
                    categories: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab']
                },
                yAxis: {
                    title: {
                        text: 'Tempo Total Investido (horas)'
                    },
                    plotLines: [{
                        value: 0,
                        width: 1,
                        color: '#808080'
                    }]
                },
                tooltip: {
                    valueSuffix: 'h'
                },
                legend: {
                    layout: 'Vertical',
                    align: 'right',
                    verticalAlign: 'middle',
                    borderWidth: 0
                },
                series: [{
                    name: 'Esta semana',
                    data: ${
                        currentWeekData
                    }
                }, {
                    name: 'Semana passada',
                    data: ${
                        week1Data
                    }
                }, {
                    name: 'Semana retrasada',
                    data: ${
                        week2Data
                    }
                }]
            });
        });
    </script>
</head>

<body>
    <br>
    <div class="container">
    <div class="row">
        <div class="col-xs-8 col-xs-offset-2  col-md-6 col-md-offset-5 centered">
            <a href="${createLink(controller: 'history', action: 'history')}" class="btn-sm btn-primary pull-left" style="margin-right: 15px;">Semana Atual</a>
            <a href="${createLink(controller: 'history', action: 'previousWeeksHistory')}" class="btn-sm btn-primary pull-left">Semanas Passadas</a>
        </div>
    </div>
    <br><br>
    <div class="panel panel-primary">
      <div class="panel-heading">Total de horas investidas: ${currentWeekHours}</div>

      <div class="panel-body">Esta semana: ${currentWeekHours}</div>
        <div class="panel-body">Semana passada: ${week1Hours}</div>
        <div class="panel-body">Semana retrasada: ${week2Hours}</div>
    </div>
    <h1 class="text-center">Ranking das atividades:</h1><br>

    <h1 class="text-center">Semana atual</h1>
    <table class="table">
        <tr>
            <th>Atividade</th>
            <th>Total de horas</th>
            <th>Proporção</th>
        </tr>
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

    <h1 class="text-center">Semana Passada</h1>
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

    <h1 class="text-center">Semana Retrasada</h1>
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

    <div class="panel panel-default">
        <div id="container" style="max-width: 800px; min-width: 310px; height: 400px; margin: 0 auto"></div>
    </div>
  </div>
</body>

</html>
