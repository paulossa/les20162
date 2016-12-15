<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="layout" content="main">
    <asset:stylesheet src="index.css" />
    <title>POvMT</title>
</head>

<body>
    <div id="container">
        <div class="container" style="height: 100%">
            <h2 class="centered">Minhas Tarefas <strong> (adicionar tempo de ontem) </strong></h2>
                    <g:each var="activity" in="${activities}">
                      <div id="card" class="container">
                        <img href="#" data-toggle="modal" data-target="#addTimeModal" src="http://www.w3schools.com/howto/img_avatar.png" class="img-circle">
                        <h2><b><a href="${createLink(controller: 'activity', action: 'show', id: activity.id)}" class="title disabled">${activity.title}</a></b></h2>
                        <hr>
                        <p>${activity.description}</p>
                        <div class="text-right activity-btns">
                            <a href="#" data-toggle="modal" data-target="#addTimeModal" id="addTI" data-activityId=${activity.id} class="btn-sm btn-primary add-ti pull-left" title="Add TI" style="margin: 1px">
                              <span class="glyphicon glyphicon-time" aria-hidden="true"></a>
                            <a href="#" class="disabled btn-sm btn-warning pull-left" style="margin: 1px"><span class="glyphicon glyphicon-pencil" aria-hidden="true"  title="Editar Atividade"></span></a>
                            <a href="#" class="disabled btn-sm btn-danger pull-left" style="margin: 1px"><span class="glyphicon glyphicon-trash" aria-hidden="true" title="Remover Atividade"></a>
                        </div>
                      </div>
                    <br>
                    </g:each>
            <br>
            <a class="btn btn-primary pull-right btn-criar-tarefa" href="${createLink(controller: 'Activity', action: 'create')}">Criar tarefa </a>
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
                                    <input type="hidden" name="activity-id" value="" id="activity-id-form">
                                    <input type="number" step="0.5" class="form-control" name="ti" id="ti" aria-describedby="basic-addon1" value="0" min="0">
                                </div>
                            </fieldset>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal" id="activity-form-dismiss">Cancelar</button>
                        <button type="button" class="btn btn-primary" id="reminder-add-ti-btn">Submeter</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
