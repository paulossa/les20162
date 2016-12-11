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
                    data: ${currentWeekData}
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
            <div class="panel-heading">Total de horas investidas:</div>
            <div class="panel-body">
                <span>Esta semana: ${currentWeekHours}</span> <br>
                <span>TI em atividades de trabalho: ${hoursByTrabalho}<span> <br>
                  <span>TI em atividades de lazer: ${hoursByLazer}<span>
                </div>
            </div>

            <h1 class="text-center">Ranking das atividades:</h1>
            <span>Filtrar</span>
            <select id="filtro" onchange="filterTable('historyTable')">
              <option value="all">Todas as atividades</option>
              <g:each in="${tags}">
                <option value="${it}">${it}</option>
              </g:each>
            </select>
            <table class="table" id="historyTable">
                <tr>
                    <th style="display:none;"></th>
                    <th>Atividade</th>
                    <th>Total de horas</th>
                    <th>Prioridade</th>
                    <th>Proporção</th>
                </tr>
                <g:each in="${activities}">
                    <tr>
                        <td style="display:none;">${it.tags}</td>
                        <td>${it.title}</td>
                        <td>${it.getInvestedHours()}</td>
                        <td>${it.priority}</td>
                        <g:if test="${currentWeekHours > 0}">
                            <td>${(it.getInvestedHours()/currentWeekHours).round(3)*100}%</td>
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
