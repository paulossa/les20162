package les

import grails.transaction.Transactional

@Transactional
class UtilService {

    def getActivities(User usr){
      Activity.findAllByOwner(usr)
    }

    def currentDate = new Date().clearTime()

    int currentDay = Calendar.instance.with {
      time = currentDate
      get( Calendar.DAY_OF_WEEK )
    }

    def daysOfThisWeek = (currentDate-currentDay+1)..(currentDate +7 - currentDay)
    def daysOfFirstWeek = (currentDate - 7 - currentDay)..(currentDate - 6 + currentDay)
    def daysOfSecondWeek = (currentDate - 13 - currentDay)..(currentDate - 13 + currentDay)

    def BEGIN_CURRENT_WEEK = currentDate-currentDay+1
    def END_CURRENT_WEEK =  currentDate +7 - currentDay

    def BEGIN_WEEK_1 = currentDate - 7 - currentDay
    def END_WEEK_1 =  currentDate - 6 + currentDay

    def BEGIN_WEEK_2 = currentDate - 7 - currentDay
    def END_WEEK_2 =  currentDate - 6 + currentDay

    def BEGIN_OF_LAST_WEEKS = currentDate - 13 - currentDay
/*
    def getDays(){
      daysOfThisWeek.each{
        println it
      }
      println "--------"
      daysOfThreeWeeks.each{
        println it
      }
    }
*/
  def getCurrentWeekActivities(User usr){
    def activities = []
    Activity.findAllByOwner(usr).each { activity ->
      activity.tis.each{
        if (BEGIN_CURRENT_WEEK < it.dateCreated && it.dateCreated < END_CURRENT_WEEK){
          activities.add(activity)
        }
      }
    }
    activities
  }

  def getWeek1Activities(User usr){
    def activities = []
    Activity.findAllByOwner(usr).each { activity ->
      activity.tis.each{
        if (BEGIN_WEEK_1 < it.dateCreated && it.dateCreated < END_WEEK_1){
          activities.add(activity)
        }
      }
    }
    activities
  }

  def getWeek2Activities(User usr){
    def activities = []
    Activity.findAllByOwner(usr).each { activity ->
      activity.tis.each{
        if (BEGIN_WEEK_2 < it.dateCreated && it.dateCreated < END_WEEK_2){
          activities.add(activity)
        }
      }
    }
    activities
  }

  def getThisWeekHours(User usr){
      def total = 0.0d
      getCurrentWeekActivities(usr).each{
        it.tis.each{
          total += it.hours
        }
      }
      total
  }

  def getWeek1Hours(User usr){
      def total = 0.0d
      getWeek1Activities(usr).each{
        it.tis.each{
          total += it.hours
        }
      }
      total
  }

  def getWeek2Hours(User usr){
      def total = 0.0d
      getWeek2Activities(usr).each{
        it.tis.each{
          total += it.hours
        }
      }
      total
  }

}
