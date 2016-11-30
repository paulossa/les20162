package les

class HistoryController {

    def utilService

    def history() {
      /*utilService.daysOfFirstWeek.each {
        println it
      }
      println "------------------------"
      print utilService.daysOfSecondWeek.each{
        println it
      }*/
      render view: 'history', model: [usr: session.user,
       activities: utilService.getCurrentWeekActivities(session.user),
       currentWeekHours: utilService.getThisWeekHours(session.user)
      ]
    }

    def previousWeeksHistory(){
      println utilService.getCurrentWeekActivities(session.user)
      println utilService.getWeek1Activities(session.user)
      println utilService.getWeek2Activities(session.user)

      render view: 'previousWeeksHistory', model: [usr: session.user,
      currentActivities: utilService.getCurrentWeekActivities(session.user),
      currentWeekHours: utilService.getThisWeekHours(session.user),
      activitiesWeek1: utilService.getWeek1Activities(session.user),
      activitiesWeek2: utilService.getWeek2Activities(session.user),
      week1Hours: utilService.getWeek1Hours(session.user),
      week2Hours: utilService.getWeek2Hours(session.user)
      ]
    }
}
