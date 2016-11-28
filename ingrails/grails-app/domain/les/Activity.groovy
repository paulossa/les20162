package les

class Activity {

  String title
  String description
  String category
  String tags

  User owner

  static hasMany = [tis: TimeInvested]

  static constraints = {
    title unique: true
    category nullable: true, inList : ["Trabalho", "Lazer"]
    tags nullable: true
    description nullable: true
  }
}
