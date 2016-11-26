<!DOCTYPE html>
<meta charset="UTF-8">
<head>
  <link rel="stylesheet" type="text/css" href="../assets/stylesheets/bootstrap.css">
  <script src="../assets/javascripts/bootstrap.js"></script>
  <script>

  var profileHTML = sessionStorage.getItem('_profile');
  document.getElementById('prof').innerHTML = profileHTML;;

  function signOut() {
      var auth2 = gapi.auth2.getAuthInstance();
      auth2.signOut().then(function() {
          window.location.href = "index.gsp";
      });
    }

  </script>
</head>

<html>
<body>

<h1>Início</h1>

<p>Nome do Usuario</p>

<div id = "prof" class="userContent"></div>

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

<h2>Minhas Tarefas</h2>
<table class="table" style="width:50%;">
  <tr>
    <th>Titulo</th>
    <th></th>
  </tr>
  <tr>
    <td>Task 1</td>
    <td>
      <button>Add TI</button>
      <button>Remover</button>
      <button>Editar</button>
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
