package les

import grails.transaction.Transactional

@Transactional
class ReminderService {
	static emailService

	def sendReminders(String time) {
		assert time ==~ /\d{2}:\d{2}/
		def reminders = Reminder.findAllByTime(time) // remindersThatShouldBeSent()
		reminders?.each { reminder ->
			emailService.sendEmail(
				reminder.email,
				"Ainda há tempo de permanecer focado, ${reminder.user.dName}.",
				"Cadastre o tempo que você investiu nas suas atividades ontem. createLink(controller: 'activity', action: 'reminder')"
				)
		}
	}

	def cleanReminders(User u) {
		def r = Reminder.findByUser(u)
        r?.delete()
	}

}
