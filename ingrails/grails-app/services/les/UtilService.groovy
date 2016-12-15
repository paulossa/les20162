package les
import static java.util.Calendar.DAY_OF_WEEK
import grails.transaction.Transactional

@Transactional
class UtilService {

    def getActivities(User usr){
      Activity.findAllByOwner(usr)
    }

    def getAllTags(User usr){
      def tags = []
      getActivities(usr).each{activity ->
        if(activity.tags != null && !(activity.tags in tags)) {
          activity.tags.split(",").each{
            tags.add(it);
          }
        }
      }
      tags
    }

    def currentDate = new Date().clearTime()

    int currentWeek = Calendar.instance.with {
      time = currentDate
      get( Calendar.WEEK_OF_YEAR )
    }

  def getCurrentWeekActivities(User usr){

    def c = Activity.createCriteria()

    currentDate = new Date().clearTime()

    Calendar calendar = Calendar.getInstance()
    calendar[DAY_OF_WEEK] = 1
    Date startOfWeek = calendar.time.clearTime() // sat 00:00
    calendar[DAY_OF_WEEK] = 7
    Date endOfWeek = calendar.time.clearTime() + 1
    def results = c.list {
      and {
        tis {
          between("dateCreated", startOfWeek, endOfWeek)
        }
      }
    }

    results
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
    println total
    total
  }

  def getThisWeekHours(User usr){
      generateCurrentWeekData(usr).sum()
  }

  def getWeek1Hours(User usr){
      generateWeek1Data(usr).sum()
  }

  def getWeek2Hours(User usr){
      generateWeek2Data(usr).sum()
  }

  /**
  * Gets an array with the total hours invested in activities each index
  * is a day of the week.
  */
  def generateCurrentWeekData(User usr){
    def currentWeekHours = [0.0,0.0,0.0,0.0,0.0,0.0,0.0]
    def actvs = getCurrentWeekActivities(usr)
    actvs.each{
      it.tis.each{
        if ( getWeek(it.dateCreated) == currentWeek ) {
          currentWeekHours[getDayOfWeek(it.dateCreated)] += it.hours
        }
      }
    }
    currentWeekHours
  }

  def generateWeek1Data(User usr){
    def week1Hours = [0.0,0.0,0.0,0.0,0.0,0.0,0.0]
    getWeek1Activities(usr).each{
      it.tis.each{
        if (getWeek(it.dateCreated)==(currentWeek - 1)) {
          week1Hours[getDayOfWeek(it.dateCreated)] += it.hours
        }
      }
    }
    week1Hours
  }

  def generateWeek2Data(User usr){
    def week2Hours = [0.0,0.0,0.0,0.0,0.0,0.0,0.0]
    getWeek2Activities(usr).each{
      it.tis.each{
        if (getWeek(it.dateCreated)==(currentWeek - 2)) {
          week2Hours[getDayOfWeek(it.dateCreated)] += it.hours
        }
      }
    }
    week2Hours
  }

  def getDayOfWeek(date){
    int day = Calendar.instance.with {
      time = date
      get( Calendar.DAY_OF_WEEK )
    }
    (day - 1)
  }

  def getWeek(date){
    int week = Calendar.instance.with {
      time = date
      get( Calendar.WEEK_OF_YEAR )
    }
  }

}
