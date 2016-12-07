package les

class UserController {

    static utilService

    def index() { }
    def login() {
      if (session.user){
        redirect uri: '/'
      }
      render view:'login' , model: [usr: null]
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
      // Reminder.findByUser(session.user)
      render view: 'notifications', model: [currentConf: [time: '04:20', notificationsEnabled: false]]
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
