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
	<br> <button class="btn btn-default"> Semana Atual </button> <button class="btn btn-default"> Semanas Passadas </button> <br><br>

	<div class="panel panel-default">
	  <div class="panel-heading">Total de horas investidas:</div>
	  <div class="panel-body">
	    <!-- Panel content -->
	  </div>
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
            <td></td>
          </tr>
        </g:each>
      </table>
	</div>
  
</body>

</html>
