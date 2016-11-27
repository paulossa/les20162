package les

import grails.transaction.Transactional

@Transactional
class UtilService {

    def getActivities(User usr){
      Activity.findAllByOwner(usr)
    }


}
