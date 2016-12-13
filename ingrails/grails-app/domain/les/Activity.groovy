package les

import static java.util.Calendar.DAY_OF_WEEK

class Activity {

  String title
  String description
  String category
  String tags
  String priority

  User owner

  static hasMany = [tis: TimeInvested]

  static constraints = {
    title unique: true
    category nullable: true, inList : ["Trabalho", "Lazer"]
    tags nullable: true
    description nullable: true
    priority nullable: true, inList :["Alta", "Media", "Baixa"]
  }

  Double getInvestedHours(){
      def soma = 0.0d
      this.tis.each {
        soma += it.hours
      }
      soma
  }

  Double getInvestedHoursThisWeek(){
      def soma = 0.0d
      Calendar calendar = Calendar.getInstance()
      calendar[DAY_OF_WEEK] = 1
      Date startOfWeek = calendar.time.clearTime() // sat 00:00
      calendar[DAY_OF_WEEK] = 7
      Date endOfWeek = calendar.time.clearTime() + 1

      this.tis.each {
        if (it.dateCreated >= startOfWeek && it.dateCreated < endOfWeek){
          soma += it.hours
        }
      }
      soma
  }

  Double getInvestedHoursNWeeksAgo(int n){
      def soma = 0.0d
      Calendar calendar = Calendar.getInstance()
      calendar[DAY_OF_WEEK] = 1
      Date startOfWeek = calendar.time.clearTime()  - (n*7)// sat 00:00
      calendar[DAY_OF_WEEK] = 7
      Date endOfWeek = calendar.time.clearTime() + 1 - (n*7)

      this.tis.each {
        if (it.dateCreated >= startOfWeek && it.dateCreated < endOfWeek){
          soma += it.hours
        }
      }
      soma
  }

  String toString() {
    title
  }
}
