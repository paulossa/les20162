package les


class AuthInterceptor {

  AuthInterceptor() {
    matchAll()
      .excludes(controller: 'user', action: 'login')
      .excludes(controller: 'user', action: 'authenticate')
  }

    boolean before() {
      println "Session user $session.user"
      if (!session?.user && (actionName != "login")){
        redirect controller: 'user', action: 'login'
        return false
      }
      return true

    }

    boolean after() { true }

    void afterView() {
        // no-op
    }
}
