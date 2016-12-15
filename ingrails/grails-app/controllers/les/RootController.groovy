package les

class RootController {

  def utilService

    def index() {
      render view: 'index', model: [usr: session.user, activities: utilService.getActivities(session.user)]
    }

    def fromYesterday() {
      render view: 'fromYesterday', model: [usr: session.user, activities: utilService.getActivities(session.user)]
    }

    def populateDb() {
      // TO-DO
    }
}
