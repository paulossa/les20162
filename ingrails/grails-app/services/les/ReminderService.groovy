package les

import static java.util.Calendar.DAY_OF_WEEK
import grails.transaction.Transactional

@Transactional
class ReminderService {
	static emailService

	def sendReminders(String time) {
		assert time ==~ /\d{2}:\d{2}/
		def reminders = remindersThatShouldBeSent(time)
		reminders?.each { reminder ->
			emailService.sendEmail(
				reminder.email,
				"Ainda h\u00E1 tempo de permanecer focado, ${reminder.user.dName}.",
				"Cadastre o tempo que voc\u00EA investiu nas suas atividades ontem. http://lespiloto.dekorps.com/root/fromYesterday Cadastre as tarefas de ontem"
				)
		}
	}

	// Deve retornar uma lista de objetos Reminder, para os casos onde as pessoas não cadastraram TIs no dia anterior.
	def remindersThatShouldBeSent(String time){
		def reminders = Reminder.findAllByTime(time)

		def out = []
		reminders.each { r ->
			if (!addedTiYesterday(r.user)){
					out << r
			}
		}

		return out
	}

	def addedTiYesterday(User u){
		def activities = Activity.findAllByOwner(u)
		def out = false

		def today = new Date().clearTime()
		def yesterday = today - 1

		activities.each { actvt ->
			actvt.tis.each { timeInvested ->
				if ( yesterday.compareTo(timeInvested.dateCreated) * timeInvested.dateCreated.compareTo(today) > 0 ) {
					out = true
				}
			}
		}

		out
	}

	def cleanReminders(User u) {
		def r = Reminder.findByUser(u)
        r?.delete()
	}

}
