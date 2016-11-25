package les

class Activity {

  String title
  String category
  String tags

  static hasMany = [tis: TimeInvested]

  static constraints = {
    title (unique: true)
  }
}
