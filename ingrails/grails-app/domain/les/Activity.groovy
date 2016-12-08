package les

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

  String toString() {
    title
  }
}
