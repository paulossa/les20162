package les

class TimeInvested {

  Double hours

  Date dateCreated
  Date lastUpdated

  static belongsTo = [activity: Activity]

  static constraints = {
    hours (min: 0.0d, max: 24.0d)
  }
}
