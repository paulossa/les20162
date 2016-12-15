package les

class HistoryController {

    def utilService
    def currentDate = new Date().clearTime()
    int currentWeek = Calendar.instance.with {
      time = currentDate
      get( Calendar.WEEK_OF_YEAR )
    }

    def history() {
      render view: 'history', model: [usr: session.user,
       activities: utilService.getCurrentWeekActivities(session.user),
       currentWeekHours: utilService.getThisWeekHours(session.user),
       currentWeekData: utilService.generateCurrentWeekData(session.user),
       hoursByTrabalho: utilService.getTotalByCategory(session.user, "Trabalho", currentWeek),
       hoursByLazer: utilService.getTotalByCategory(session.user, "Lazer", currentWeek),
       tags: utilService.getAllTags(session.user)
      ]
    }

    def previousWeeksHistory(){
      render view: 'previousWeeksHistory', model: [usr: session.user,
      tags: utilService.getAllTags(session.user),
      currentActivities: utilService.getCurrentWeekActivities(session.user),
      currentWeekHours: utilService.getThisWeekHours(session.user),
      hoursByTrabalho: utilService.getTotalByCategory(session.user, "Trabalho", currentWeek),
      hoursByLazer: utilService.getTotalByCategory(session.user, "Lazer", currentWeek),
      currentWeekData: utilService.generateCurrentWeekData(session.user),

      activitiesWeek1: utilService.getWeek1Activities(session.user),
      week1Hours: utilService.getWeek1Hours(session.user),
      week1Data: utilService.generateWeek1Data(session.user),
      hoursByTrabalho1: utilService.getTotalByCategory(session.user, "Trabalho", currentWeek-1),
      hoursByLazer1: utilService.getTotalByCategory(session.user, "Lazer", currentWeek-1),

      activitiesWeek2: utilService.getWeek2Activities(session.user),
      week2Hours: utilService.getWeek2Hours(session.user),
      week2Data: utilService.generateWeek2Data(session.user),
      hoursByTrabalho2: utilService.getTotalByCategory(session.user, "Trabalho", currentWeek-2),
      hoursByLazer2: utilService.getTotalByCategory(session.user, "Lazer", currentWeek-2)

      ]
    }
}
