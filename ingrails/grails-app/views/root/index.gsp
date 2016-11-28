<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="layout" content="main">
    <title>POvMT</title>
    <asset:stylesheet src="bootstrap.css" />
    <asset:stylesheet src="application.css" />
    <asset:javascript src="application.js" />
</head>

<body>
    <div id="container">
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
                        <button class="btn btn-primary" data-toggle="modal" data-target="#addTimeModal" id="addTI">Add TI</button>
                        <button class="btn btn-danger">Remover</button>
                        <button class="btn btn-default" onclick="location.href = 'newtask';">Editar</button>
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
            <a class="btn btn-primary pull-right btn-criar-tarefa" href="${createLink(controller: 'Activity', action: 'create')}">Criar Nova Tarefa </a>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="addTimeModal" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Tempo investido</h4>
                    </div>
                    <div class="modal-body">
                      <form>
                        <fieldset>
                          <div class="input-group">
                            <span class="input-group-addon" id="basic-addon1">Tempo Investido</span>
                            <input type="number" class="form-control" name="ti" id="ti" aria-describedby="basic-addon1">
                          </div>
                        </fieldset>
                      </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                        <button type="button" class="btn btn-primary">Submeter</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>




</html>
