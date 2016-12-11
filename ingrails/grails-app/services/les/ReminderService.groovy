package les

import grails.transaction.Transactional

@Transactional
class ReminderService {



	def cleanReminders(User u) {
		def r = Reminder.findByUser(u)
        r?.delete()
	}

    def serviceMethod() {

    }
}
