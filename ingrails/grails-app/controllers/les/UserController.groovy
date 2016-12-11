package les

class UserController {

    static utilService
    static reminderService

    def index() { }
    def login() {
      if (session.user){
        redirect uri: '/'
      }
      render view:'login' , model: [usr: null]
    }

    def setReminder(){
      String hourOfDay = params?.hourOfDay
      String email = params?.email 
      def permission = params.get('notifications-allowed')

      if (hourOfDay ==~ /\d{2}:\d{2}/) {

        def hour = hourOfDay.split(':')[0].toInteger()
        def minute = hourOfDay.split(':')[1].toInteger()

        if ( (hour > 24 || hour < 0)  || (minute >= 60 || minute < 0)){
          flash.message = "Hora invalida"
          forward action: 'notifications'
          return
        } 
      } else {
        flash.message = "Formato de hora inválido. Use o formato HH:mm."
      }

      if (!permission) {
        reminderService.cleanReminders(session.user)
        flash.message = "Você não receberá mais notificações"
        forward action: 'notifications'
      } else {
        
        if (Reminder.findByUser(session.user)) {
          reminderService.cleanReminders(session.user)
        }

        Reminder r = new Reminder(email: email, time: hourOfDay, user: session.user)

        if (r.hasErrors()) {
          flash.message = "Erros foram encontrados, por favor tente novamente. [${r.errors}]"
          forward action: 'notifications'
        } else {
          r.save()
          flash.message = "Lembrete salvo com sucesso."
          forward action: 'notifications'
        }
      }
    }

    def authenticate() {
      def user = User.findByUuid(params.id)
      if (!user) {
        def newUser = new User(givenName: params?.givenName, dName: params?.displayName, picUrl: params?.picUrl, email: params?.email, uuid: params?.id)
        if (newUser.validate()){
          newUser.save(flush:true)
        } else {
          response.status = 401
          flash.message = "Seu login é inconsistente."
        }
      }

      session.user = user

      chain controller: "root", action:"index", model: [usr: session.user, activities: utilService.getActivities(session.user)]
    }

    def notifications() {
      def r = Reminder.findByUser(session.user)
      render view: 'notifications', model: [currentConf: [email: (r?.email == null) ? "${session.user.email}" : "${r.email}", time: r?.time, notificationsEnabled: (r != null)]]
    }

    def logout() {
      session.user = null
      redirect action: 'login'
    }

    def populateDb() {
      10.times {
        def a = new Activity(title: "Title = ${it}", owner: session.user).save()
      }
      redirect uri: '/'
    }
}
