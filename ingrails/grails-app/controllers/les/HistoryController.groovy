package les

class HistoryController {

    def utilService

    def history() {
      render view: 'history', model: [usr: session.user, activities: utilService.getActivities(session.user)]
    }
}
