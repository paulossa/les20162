<!DOCTYPE html>
<html lang="pt-BR">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="layout" content="main">
    <title>Cadastrar atividade</title>
    <asset:stylesheet src="bootstrap.css" />
    <asset:stylesheet src="application.css" />
    <asset:javascript src="jquery.js" />
    <asset:javascript src="bootstrap.js" />
    <asset:javascript src="application.js" />
</head>

<div id="wrapper">
	<body>
		<div class="container-fluid">
			<div class="col-lg-6 col-md-3 col-sm-6 col-xs-12">
				<g:hasErrors bean="${this.activity}">
				<ul class="errors" role="alert">
						<g:eachError bean="${this.activity}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
						</g:eachError>
				</ul>
				</g:hasErrors>
				<form class="form-inline povmt-form" action="${createLink(controller: 'Activity', action: 'update')}" method="POST">
					<div class="form-group">
						<input type="hidden" name="owner.id" value="${session.user.id}">
            <input type="hidden" name="id" value="${activity.id}">
						<div class="input-group" style="width: 100%">
				      <div class="input-group-addon"  style="width: 30%">Titulo</div>
				      <input type="text" name="title" class="form-control" placeholder="Titulo" value="${activity?.title}" required>
				    </div>
						<div class="input-group" style="width: 100%">
				      <div class="input-group-addon"  style="width: 30%">Descrição</div>
				      <input type="text" name="description" class="form-control" placeholder="Descrição" value="${activity?.description}">
				    </div>
						<div class="input-group" style="width: 100%">
				      <div class="input-group-addon" style="width: 30%">Categoria</div>
							<g:select name="category" class="form-control" from="${['Trabalho', 'Lazer']}" value="${activity?.category}"/>
				      <!-- <select name="" id=""></select> -->
				    </div>
						<div class="input-group" style="width: 100%; display: none">
				      <div class="input-group-addon" style="width: 30%">Tags</div>
				      <input type="text" name="description" class="form-control" placeholder="Tags" value="${activity?.tags}">
				    </div>
						<input type="submit" class="btn btn-primary btn-lg" value="Salvar" style="width: 100%; margin-top: 40px;">
					</div>
				</form>





				<!-- <div class="input-group">

				  <span class="input-group-addon col-sm-3" id="basic-addon1">Título</span>
				  <input type="text" class="form-control" aria-describedby="basic-addon1">
				</div>

				<br>
				<div class="input-group">
				  <span class="input-group-addon" id="basic-addon2">Descrição</span>
				  <input type="text" class="form-control" aria-describedby="basic-addon2">
				</div>

				<br>
				<div class="input-group">
				  <span class="input-group-addon" id="basic-addon3">Data</span>
				  <input type="text" class="form-control" aria-describedby="basic-addon3">
				</div> -->

			</div>
		</div>

	</body>
</div>

</html>
