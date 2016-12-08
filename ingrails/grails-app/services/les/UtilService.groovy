package les

import grails.transaction.Transactional

@Transactional
class UtilService {

    def getActivities(User usr){
      Activity.findAllByOwner(usr)
    }

    def currentDate = new Date().clearTime()

    int currentWeek = Calendar.instance.with {
      time = currentDate
      get( Calendar.WEEK_OF_YEAR )
    }

  def getCurrentWeekActivities(User usr){
    def activities = []
    Activity.findAllByOwner(usr).each { activity ->
      activity.tis.each{
        if (getWeek(it.dateCreated)==currentWeek && !(activity in activities) ){
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
        if (getWeek(it.dateCreated)==currentWeek-1 && !(activity in activities)){
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
        if (getWeek(it.dateCreated)==currentWeek-2 && !(activity in activities)){
          activities.add(activity)
        }
      }
    }
    activities
  }

  def getTotalByCategory(User usr, String  category, int week){
    def total = 0.0d
    getCurrentWeekActivities(usr).each{ activity ->
      if(activity.category == category){
        activity.tis.each{
          if(getWeek(it.dateCreated)==week){
            total = it.hours
          }
        }
      }
    }
    total
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

  def generateCurrentWeekData(User usr){
    def currentWeekHours = [0.0,0.0,0.0,0.0,0.0,0.0,0.0]
    getCurrentWeekActivities(usr).each{
      it.tis.each{
        currentWeekHours[getDayOfWeek(it.dateCreated)] += it.hours
      }
    }
    currentWeekHours
  }

  def generateWeek1Data(User usr){
    def week1Hours = [0.0,0.0,0.0,0.0,0.0,0.0,0.0]
    getWeek1Activities(usr).each{
      it.tis.each{
        week1Hours[getDayOfWeek(it.dateCreated)] += it.hours
      }
    }
    week1Hours
  }

  def generateWeek2Data(User usr){
    def week2Hours = [0.0,0.0,0.0,0.0,0.0,0.0,0.0]
    getWeek2Activities(usr).each{
      it.tis.each{
        week2Hours[getDayOfWeek(it.dateCreated)] += it.hours
      }
    }
    week2Hours
  }

  def getDayOfWeek(date){
    int day = Calendar.instance.with {
      time = date
      get( Calendar.DAY_OF_WEEK )
    }
  }

  def getWeek(date){
    int week = Calendar.instance.with {
      time = date
      get( Calendar.WEEK_OF_YEAR )
    }
  }

}
