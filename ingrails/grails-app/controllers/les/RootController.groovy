package les

class RootController {

    def index() {
      render view: 'index', model: [usr: session.user]
    }

    def populateDb() {
      // TO-DO
    }
}
