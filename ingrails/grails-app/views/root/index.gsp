<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="layout" content="main">
    <title>POvMT</title>
    <asset:stylesheet src="bootstrap.css" />
    <asset:stylesheet src="application.css" />
    <asset:javascript src="jquery.js" />
    <asset:javascript src="bootstrap.js" />
    <asset:javascript src="application.js" />
</head>
<div id="wrapper">
    <body>
        <div class="container-fluid">

            <h2 class="centered">Minhas Tarefas</h2>
            <table class="table">
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
                      <button class="btn btn-default">Add TI</button>
                      <button class="btn btn-default">Remover</button>
                      <button class="btn btn-default">Editar</button>
                    </td>
                </tr>
            </table>
            <br>
            <button class="btn btn-default pull-right" onclick="location.href = 'newtask';">Criar Nova Tarefa </button>
        </div>
</div>
</body>

</html>
