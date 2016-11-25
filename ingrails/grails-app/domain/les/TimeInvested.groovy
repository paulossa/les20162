package les

class TimeInvested {

  Double hours

  static belongsTo = [activity: Activity]

  static constraints = {
    hours (min: 0.0d, max: 24.0d)
  }
}
