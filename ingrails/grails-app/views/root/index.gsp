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
        <div class="container-fluid" style="height:100%;">

            <h2 class="centered">Minhas Tarefas</h2>
            <g:each var="activity" in="${activities}">
              <div class="activity-card">
                <span class="title">
                  ${activity.title}
                </span>
                <div class="activity-btns">
                  <a href="#" data-toggle="modal" data-target="#addTimeModal" id="addTI" class="btn btn-primary">Add TI</a>
                  <a href="#${createLink(controller: 'activity', action: 'edit', id: activity.id)}" class="btn btn-warning">Editar</a>
                  <a href="#" class="btn btn-danger">Remover</a>
                </div>
              </div>
            </g:each>

                        <!-- <button class="btn btn-primary"  data-target="#addTimeModal" id="addTI">Add TI</button>
                        <button class="btn btn-danger">Remover</button>
                        <button class="btn btn-default" onclick="location.href = 'newtask';">Editar</button> -->

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
