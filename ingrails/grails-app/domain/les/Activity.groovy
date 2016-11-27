package les

class Activity {

  String title
  String category
  String tags

  User owner

  static hasMany = [tis: TimeInvested]

  static constraints = {
    title unique: true
    category nullable: true
    tags nullable: true
  }
}
