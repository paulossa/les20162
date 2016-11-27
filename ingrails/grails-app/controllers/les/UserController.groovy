package les

class UserController {

    def index() { }
    def login() {
      if (session.user){
        redirect uri: '/'
      }
    }

    def authenticate() {
      def user = User.findByUuid(params.id)
      println params
      if (!user) {
        println "inside !user - ${params.id}"
        def newUser = new User(givenName: params?.givenName, dName: params?.displayName, picUrl: params?.picUrl, email: params?.email, uuid: params?.id)
        if (newUser.validate()){
          println "valid user = $newUser and ${newUser.hasErrors()} ${newUser.errors}"
          newUser.save(flush:true)
        } else {
          println "INvalid user"
          println user.errors
          response.status = 401
          flash.message = "Seu login é inconsistente."
        }
      }

      session.user = user

      redirect uri: "/"
      // TO-DO receive the data and if the user is already created set session.user else Create new user and set session.user

    }

    def logout() {
      session.user = null
      redirect action: 'login'
    }
}
