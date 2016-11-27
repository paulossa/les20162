<!DOCTYPE html>
<html lang="en">
<meta charset="UTF-8">

<head>
    <title>POvMT - Para Onde vai Meu Tempo?</title>
    <asset:stylesheet src="bootstrap.css" />
    <asset:javascript src="jquery.js" />
    <asset:javascript src="application.js" />
    <asset:javascript src="bootstrap.js"/>
    <meta name="google-signin-client_id" content="686461622790-esursav91456althgbjg3d2mka2gedgg.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/client:platform.js?onload=renderButton" async defer></script>
</head>

<body>
  <h1>Início</h1>
  <a href="/">Inicio</a>
  <a href="newtask">Nova Tarefa</a>
  <a href="history">Historico</a>
  <a href="addTi">Add TI</a>

    <a href="${createLink(controller: 'user', action: 'logout')}" class="logout-btn">Logout</a>
<br>
    <br>

    <p>${usr}</p>

    <h2>Minhas Tarefas</h2>
    <table class="table" style="width:50%;">
      <tr>
        <th>Titulo</th>
        <th></th>
      </tr>
      <tr>
        <td>Task 1</td>
        <td>
          <button class="btn btn-default">Add TI</button>
          <button class="btn btn-default">Remover</button>
          <button class="btn btn-default">Editar</button>
        </td>
      </tr>
      <tr>
        <td>Task 2</td>
        <td>
          <button>Add TI</button>
          <button>Remover</button>
          <button>Editar</button>
        </td>
      </tr>
      <tr>
        <td>Task 3</td>
        <td>
          <button>Add TI</button>
          <button>Remover</button>
          <button>Editar</button>
        </td>
      </tr>
    </table>
    <br>
    <button class="btn btn-default"> Criar Nova Tarefa </button>
</body>
</html>
