package les

class User {

  String givenName
  String dName
  String picUrl
  String email
  String uuid

  static constraints = {
    uuid nullable: false, unique: true
    email nullable: false
    picUrl nullable: true
    givenName nullable: true
    dName blank: true, nullable: true
  }

  String toString() {
    dName
  }
}
