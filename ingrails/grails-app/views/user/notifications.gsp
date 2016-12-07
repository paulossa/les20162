<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'timeInvested.label', default: 'TimeInvested')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        <asset:javascript src="jquery.js" />
        <asset:javascript src="bootstrap-timepicker.min.js" />
        <asset:stylesheet src="bootstrap-timepicker.min.css" />


    </head>
    <body>
        <div id="create-timeInvested" class="content scaffold-create" role="main">

            <g:hasErrors bean="${this.timeInvested}">
            <ul class="errors" role="alert">
                <g:eachError bean="${this.timeInvested}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
            </ul>
            </g:hasErrors>

            <div class="well well-sm text-center">
              Você gostaria de receber lembretes via email?
            </div>

            <form class="form-inline povmt-form" action="#" method="POST">
              <div class="input-group">
                <span class="input-group-addon">
                  <label for="notifications-allowed">Permitir</label>
                  <input type="checkbox" aria-label="Allow notifications" name="notifications-allowed" ${currentConf.notificationsEnabled ? 'checked': ''}>
                </span>
                <input type="text" class="form-control" aria-label="..." placeholder="Email" value="${session.user.email}" name="email">
              </div>
              <input type="text" pattern="\d{2}:\d{2}" class="form-control" placeholder="Hora de envio (HH:mm)" value="${currentConf.time}" name="hourOfDay">
              <input type="submit" class="btn btn-primary btn-lg" value="Salvar configuração" style="width: 100%; margin-top: 40px;">
    					<!-- <div class="form-group">
                <span class="input-group-addon">
                  <input type="checkbox" aria-label="Checkbox Yes/No" >
                </span>
                <input type="text" class="form-control" aria-label="Email" name="email">
    					</div> -->


    				</form>
            <!-- <g:form action="save">
                <fieldset class="form">
                </fieldset>
                <fieldset class="buttons">
                    <g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form> -->
        </div>

    <script>
      $(document).ready(function(){
        var notificationscb = $("input[name=notifications-allowed]");

        if (!notificationscb.prop('checked')){
          $('input[name=email]').prop('disabled', true);
          $('input[name=hourOfDay]').prop('disabled', true);
        }

        notificationscb.on('click', function() {
          var wantsEmails = $(this).prop('checked');
          if (wantsEmails){
            $('input[name=email]').prop('disabled', false);
            $('input[name=hourOfDay]').prop('disabled', false);
          } else {
            $('input[name=email]').prop('disabled', true);
            $('input[name=hourOfDay]').prop('disabled', true);
          }
        });


      });
    </script>
    </body>
</html>
